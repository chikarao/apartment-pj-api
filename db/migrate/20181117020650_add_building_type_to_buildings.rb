class AddBuildingTypeToBuildings < ActiveRecord::Migration[5.1]
  def change
    add_column :buildings, :building_type, :string
  end
end
