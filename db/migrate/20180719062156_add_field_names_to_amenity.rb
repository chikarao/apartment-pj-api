class AddFieldNamesToAmenity < ActiveRecord::Migration[5.1]
  def change
    add_column :amenities, :elevator, :boolean, :default => false
    add_column :amenities, :washer_dryer_area, :boolean, :default => false
    add_column :amenities, :bath_toilet_separate, :boolean, :default => false
    add_column :amenities, :shower_bath_separate, :boolean, :default => false
    add_column :amenities, :front_desk, :boolean, :default => false
    add_column :amenities, :top_floor, :boolean, :default => false
    add_column :amenities, :corner_flat, :boolean, :default => false
    add_column :amenities, :first_floor, :boolean, :default => false
    add_column :amenities, :pets_allowed, :boolean, :default => false
  end
end
