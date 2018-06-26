class CreateAmenities < ActiveRecord::Migration[5.1]
  def change
    create_table :amenities do |t|
      t.references :flat, foreign_key: true
      t.boolean :auto_lock, :default => false
      t.boolean :security_system, :default => false
      t.boolean :wifi, :default => false
      t.boolean :pocket_wifi, :default => false
      t.boolean :iron, :default => false
      t.boolean :ac, :default => false
      t.boolean :heater, :default => false
      t.boolean :bath_essentials, :default => false
      t.boolean :hot_water, :default => false
      t.boolean :parking, :default => false
      t.integer :parking_spaces, :default => 0
      t.boolean :tv, :default => false
      t.boolean :dvd_player, :default => false
      t.boolean :cable_tv, :default => false
      t.boolean :sofa, :default => false
      t.boolean :kitchen, :default => false
      t.boolean :dining_table, :default => false
      t.boolean :dish_washer, :default => false
      t.boolean :washer, :default => false
      t.boolean :dryer, :default => false
      t.boolean :cooking_basics, :default => false
      t.boolean :eating_utensils, :default => false
      t.boolean :microwave, :default => false
      t.boolean :refrigerator, :default => false
      t.boolean :oven, :default => false
      t.boolean :crib, :default => false
      t.boolean :high_chair, :default => false
      t.boolean :bath_tub, :default => false
      t.boolean :washlet, :default => false
      t.boolean :hairdryer, :default => false
      t.boolean :fire_extinguisher, :default => false
      t.boolean :lockbox, :default => false
      t.boolean :pool, :default => false
      t.boolean :jacuzzi, :default => false

      t.timestamps
    end
  end
end
