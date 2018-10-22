class ChangeColumnDefaultAmenities < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:amenities, :shower, false)
    change_column_default(:amenities, :wash_basin, false)
    change_column_default(:amenities, :kitchen_grill, false)
    change_column_default(:amenities, :lighting_fixed, false)
    change_column_default(:amenities, :internet_ready, false)
    change_column_default(:amenities, :mail_box, false)
    change_column_default(:amenities, :parcel_delivery_box, false)
    change_column_default(:amenities, :lock_key, false)
    # change_column_default :amenities, :shower, :default => false
    # change_column_default :amenities, :wash_basin, :default => false
    # change_column_default :amenities, :kitchen_grill, :default => false
    # change_column_default :amenities, :lighting_fixed, :default => false
    # change_column_default :amenities, :internet_ready, :default => false
    # change_column_default :amenities, :mail_box, :default => false
    # change_column_default :amenities, :parcel_delivery_box, :default => false
    # change_column_default :amenities, :lock_key, :default => false
  end
end
