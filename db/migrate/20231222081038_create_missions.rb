class CreateMissions < ActiveRecord::Migration[7.0]
  def change
    create_table :missions do |t|
      t.string :name
      t.text :description
      t.string :completion_criteria

      t.timestamps
    end
  end
end
