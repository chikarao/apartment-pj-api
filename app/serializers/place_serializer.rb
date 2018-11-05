class PlaceSerializer < ActiveModel::Serializer
  attributes :id, :flat_id, :placeid, :place_name, :category, :lat, :lng, :distance, :duration, :language
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
