class AddBasicToAmenities < ActiveRecord::Migration[5.1]
  def change
    add_column :amenities, :basic, :boolean, :default => true
  end
end
