class AddRankToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :rank, :string
  end
end
