class FlatSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :lat, :lng, :address1, :city, :zip, :country, :area,
  :price_per_day, :price_per_month, :guests, :sales_point, :description,
  :rooms, :beds, :flat_type, :bath

  # :total_reviews
  # :average_rating_of_book,
  # :content_rating_of_book, :recommend_rating_of_book,

  has_many :images
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
