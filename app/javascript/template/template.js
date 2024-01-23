document.addEventListener("turbo:load", function() {
  var menu = document.getElementById('custom-context-menu');
  var deleteButton = document.getElementById('delete-memo');

  // 名前変更に関する要素
  var renameButton = document.getElementById('rename-memo');
  var renamePopup = document.getElementById('renamePopup');
  var saveBtn = document.getElementById('saveMemoName');
  var newMemoNameInput = document.getElementById('newMemoName');
  var selectedMemoId; // 選択されたメモのIDを保持するための変数

  // メモがリストされているかどうかのチェック
  if (menu && deleteButton && renamePopup) {
    document.querySelectorAll('.list-group-item').forEach(function (memo) {
      memo.addEventListener('contextmenu', function (e) {
        e.preventDefault();

        var memoId = memo.getAttribute('data-memo-id');
        var folderId = memo.closest('.list-group').getAttribute('data-folder-id');

        // 削除リンクのhref属性を更新
        deleteButton.href = `/folders/${folderId}/memos/${memoId}`;
        deleteButton.setAttribute('data-turbo-method', 'delete');
        deleteButton.setAttribute('data-turbo-confirm', '削除してよろしいですか？');

        // 名前変更リンクのクリックイベント
        renameButton.onclick = function() {
          e.stopPropagation(); // イベントのバブリングを防ぐ
          selectedMemoId = memoId; // 選択されたメモのIDを保存
          newMemoNameInput.value = memo.textContent.trim(); // 現在のメモ名を設定

          document.getElementById('rename-form').action = `/folders/${folderId}/memos/${selectedMemoId}`;

          renamePopup.style.display = 'block'; // ポップアップを表示

          menu.classList.add('d-none');
        };

        menu.style.top = e.pageY + 'px';
        menu.style.left = e.pageX + 'px';
        menu.classList.remove('d-none');
      });
    });

    //名前変更ボタン
    saveBtn.addEventListener('click', function() {
    var newMemoName = newMemoNameInput.value;
    var folderId = document.querySelector('.list-group').getAttribute('data-folder-id');
          
    fetch(`/folders/${folderId}/memos/${selectedMemoId}`, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content
      },
      body: JSON.stringify({ memo: { title: newMemoName} })
      })
      .then(response => response.json())
      .then(data => {
      if (data.success) {
        // メモ名を更新する処理
        document.querySelector(`[data-memo-id="${selectedMemoId}"] .memo-title`).textContent = newMemoName;
        renamePopup.style.display = 'none';
      } else {
        // エラー処理
        console.error('Error:', data.error);
        }
      })
      .catch(error => {
        console.error('Error:', error);
      });
    });

  // 2回目のクリックでメニューを削除
    // メニューまたはポップアップの外側がクリックされた場合のみ閉じる
    document.addEventListener('click', function (e) {
      if (!menu.contains(e.target)) {
        menu.classList.add('d-none');
      }
      if (!renamePopup.contains(e.target) && e.target !== renameButton) {
        renamePopup.style.display = 'none';
      }
    });

    // ポップアップ自体のクリックイベントを無視する
    renamePopup.addEventListener('click', function(e) {
      e.stopPropagation();
    });
  }
});
