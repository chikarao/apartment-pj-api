class CreateAmenities < ActiveRecord::Migration[5.1]
  def change
    create_table :amenities do |t|
      t.references :flat, foreign_key: true
      t.boolean :auto_lock
      t.boolean :security_system
      t.boolean :wifi
      t.boolean :pocket_wifi
      t.boolean :iron
      t.boolean :ac
      t.boolean :heater
      t.boolean :bath_essentials
      t.boolean :hot_water
      t.boolean :parking
      t.boolean :tv
      t.boolean :dvd_player
      t.boolean :sofa
      t.boolean :kitchen
      t.boolean :dining_table
      t.boolean :dish_washer
      t.boolean :washer
      t.boolean :dryer
      t.boolean :cooking_basics
      t.boolean :eating_utensils
      t.boolean :microwave
      t.boolean :refrigerator
      t.boolean :oven
      t.boolean :crib
      t.boolean :high_chair
      t.boolean :bath_tub
      t.boolean :washlet
      t.boolean :hairdryer
      t.boolean :fire_extinguisher
      t.boolean :lockbox

      t.timestamps
    end
  end
end
