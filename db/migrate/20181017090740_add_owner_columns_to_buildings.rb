class AddOwnerColumnsToBuildings < ActiveRecord::Migration[5.1]
  def change
    add_column :buildings, :building_owner_name, :string
    add_column :buildings, :building_owner_address, :string
    add_column :buildings, :building_owner_phone, :string
  end
end
