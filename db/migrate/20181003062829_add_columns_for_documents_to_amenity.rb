class AddColumnsForDocumentsToAmenity < ActiveRecord::Migration[5.1]
  def change
    add_column :amenities, :shower, :boolean
    add_column :amenities, :wash_basin, :boolean
    add_column :amenities, :kitchen_grill, :boolean
    add_column :amenities, :lighting_fixed, :boolean
    add_column :amenities, :internet_ready, :boolean
    add_column :amenities, :mail_box, :boolean
    add_column :amenities, :parcel_delivery_box, :boolean
    add_column :amenities, :lock_key, :boolean
  end
end
