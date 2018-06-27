class AddWheelchairAccessibleToAmenities < ActiveRecord::Migration[5.1]
  def change
    add_column :amenities, :wheelchair_accessible, :boolean, :default => false
  end
end
