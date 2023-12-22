class AddPointsValueToMissions < ActiveRecord::Migration[7.0]
  def change
    add_column :missions, :points_value, :integer
  end
end
