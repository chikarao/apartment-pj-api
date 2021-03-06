class AmenitySerializer < ActiveModel::Serializer
  attributes :id,
  :flat_id,
  :auto_lock,
  :security_system,
  :wifi,
  :pocket_wifi,
  :wheelchair_accessible,
  :ac,
  :heater,
  :bath_essentials,
  :hot_water,
  :parking,
  :tv,
  :dvd_player,
  :sofa,
  :kitchen,
  :dining_table,
  :dish_washer,
  :iron,
  :washer,
  :dryer,
  :cooking_basics,
  :eating_utensils,
  :microwave,
  :refrigerator,
  :oven,
  :crib,
  :high_chair,
  :bath_tub,
  :washlet,
  :hairdryer,
  :fire_extinguisher,
  :lockbox,
  :washer_dryer_area,
  :cable_tv,
  :shower,
  :wash_basin,
  :kitchen_grill,
  :lighting_fixed,
  :internet_ready,
  :mail_box,
  :parcel_delivery_box,
  :lock_key,
  :created_at,
  :updated_at
  # :total_reviews
  # :average_rating_of_book,
  # :content_rating_of_book, :recommend_rating_of_book,

  belongs_to :flat
  # has_many :conversations
  #
  # def average_rating_of_book
  #   object.reviews.count == 0 ? 0 : object.reviews.average(:average_rating).round(1)
  # end
  # def content_rating_of_book
  #   object.reviews.count == 0 ? 0 : object.reviews.average(:content_rating).round(1)
  # end
  # def recommend_rating_of_book
  #   object.reviews.count == 0 ? 0 : object.reviews.average(:recommend_rating).round(1)
  # end

  # def total_reviews
  #   object.reviews_count
  #   #instead of .reviews.count using counter culture
  # end
end
