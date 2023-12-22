class CreateUserTitles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_titles do |t|
      t.references :user, null: false, foreign_key: true
      t.references :title, null: false, foreign_key: true

      t.timestamps
    end
  end
end
