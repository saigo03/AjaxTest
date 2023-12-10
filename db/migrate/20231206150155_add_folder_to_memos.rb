class AddFolderToMemos < ActiveRecord::Migration[7.0]
  def change
    add_reference :memos, :folder, null: true, foreign_key: true
  end
end
