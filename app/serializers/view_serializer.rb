class ViewSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :flat_id, :created_at, :device, :location
  # :total_reviews
  # :average_rating_of_book,
  # :content_rating_of_book, :recommend_rating_of_book,

  belongs_to :flat
  belongs_to :user
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
