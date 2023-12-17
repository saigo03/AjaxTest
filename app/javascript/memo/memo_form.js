document.addEventListener("turbo:load", function() {
  var insertButton = document.getElementById('insert_text');

  // ボタンが存在する場合のみイベントリスナーを追加
  if (insertButton) {
    insertButton.addEventListener('click', function() {
      var textarea = document.getElementById('memo_content');
      var textToInsert = "ここに挿入する特定の文字";
      
      // テキストエリアが存在する場合のみテキストを挿入
      if (textarea) {
        textarea.value += textToInsert;
      }
    });
  }
});
