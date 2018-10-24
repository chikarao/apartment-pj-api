class AddColumnsToFacilities < ActiveRecord::Migration[5.1]
  def change
    add_column :facilities, :facility_deposit, :float
    add_column :facilities, :facility_key_money, :float
    add_column :facilities, :facility_management_fees, :float
    add_column :facilities, :facility_format, :string
    add_column :facilities, :facility_broker_fees, :float
    add_column :facilities, :facility_name, :string
    add_column :facilities, :on_building_grounds, :boolean, :default => true
  end
end
