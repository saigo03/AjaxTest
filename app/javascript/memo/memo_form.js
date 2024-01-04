document.addEventListener("turbo:load", function() {
  var textarea = document.getElementById('memo_content');

  var templates = {
    'clear_textarea': '',
    'insert_text2': `
タイトル: [コードスニペットのタイトル]
説明: [コードの用途や機能についての簡潔な説明]
カテゴリ: [言語やテクノロジーのカテゴリ]
...
`,
    'insert_text3': `
タイトル: [エラーメッセージの概要]
説明: [エラーが発生した時の状況や前後のアクションについての説明]
カテゴリ: [言語やフレームワークのカテゴリ]
...
`
  };

  // モーダル内のボタンにイベントリスナーを設定
  document.querySelectorAll('#templateModal .btn').forEach(function(button) {
    button.addEventListener('click', function() {
      var templateType = button.getAttribute('data-template-type');
      if (templateType === 'clear_textarea') {
        textarea.value = ''; // テキストエリアを完全にクリア
      } else if (templates[templateType]) {
        textarea.value += templates[templateType];
      }
      $('#templateModal').modal('hide'); // モーダルを閉じる
    });
  });
});
