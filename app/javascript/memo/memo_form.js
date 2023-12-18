document.addEventListener("turbo:load", function() {
  // テキストエリアの要素を取得
  var textarea = document.getElementById('memo_content');

  // テキストエリアをクリアするボタンのイベントリスナーを設定
  var clearTextareaButton = document.getElementById('clear_textarea');
  if (clearTextareaButton) {
    clearTextareaButton.addEventListener('click', function() {
      var textarea = document.getElementById('memo_content');
      if (textarea) {
        textarea.value = '';
      }
    });
  }

  // 貼り付けテンプレート
  var insertTemplateButton = document.getElementById('insert_text2');
  if (insertTemplateButton) {
    insertTemplateButton.addEventListener('click', function() {
      var pasteTemplate = `
タイトル: [コードスニペットのタイトル]
説明: [コードの用途や機能についての簡潔な説明]
カテゴリ: [言語やテクノロジーのカテゴリ]

コード:
[ここにコードスニペットを貼り付ける]

使用例:
[コードがどのように使われるかの具体例]

注意点:
[コードを使用する際の注意事項や、依存関係についての説明]

参照リンク:
[参考になるドキュメントやチュートリアルのURL]
`;
      textarea.value += pasteTemplate;
    });
  }

  // エラーテンプレート
  var insertErrorTemplateButton = document.getElementById('insert_text3');
  if (insertErrorTemplateButton) {
    insertErrorTemplateButton.addEventListener('click', function() {
      var errorTemplate = `
タイトル: [エラーメッセージの概要]
説明: [エラーが発生した時の状況や前後のアクションについての説明]
カテゴリ: [言語やフレームワークのカテゴリ]

発生時のコードスニペット:
[エラーが発生したコードの具体的な部分]

試した解決策:
  1. [試した解決策の説明]
  2. [試した解決策の説明]
  3. [試した解決策の説明]

解決した方法:
  [最終的に問題を解決した方法]

役立ったリソース:
  [エラー解決の際に参考になったウェブサイトやドキュメントのURL]
`;
      textarea.value += errorTemplate;
    });
  }
});
