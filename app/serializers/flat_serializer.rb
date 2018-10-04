class FlatSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :lat, :lng, :unit, :address1, :city, :zip, :country, :area,
  :price_per_day, :price_per_month, :guests, :sales_point, :description,
  :rooms, :beds, :king_or_queen_bed,:flat_type, :bath, :toilet, :intro, :state, :region,
  :address2, :cancellation, :smoking, :size, :station, :minutes_to_station,
  :station1, :minutes_to_station1, :parking_included, :year_built, :layout, :balcony_size,
  :language_code, :images, :user, :likes, :amenity, :views, :places, :flat_languages,
  :calendars, :building, :created_at, :updated_at
# :building,
  # :total_reviews
  # :average_rating_of_book,
  # :content_rating_of_book, :recommend_rating_of_book,

  has_many :images
  has_many :bookings
  has_many :likes
  belongs_to :user
  # belongs_to :building
  # has_one :building
  has_one :amenity
  has_many :views
  has_many :places
  has_many :flat_languages
  has_many :calendars
  # has_many :conversations
  # has_many :reviews
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
