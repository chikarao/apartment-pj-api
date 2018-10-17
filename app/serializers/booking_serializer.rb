class BookingSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :flat_id, :date_start, :date_end, :created_at, :booking_by_owner, :booking_by_ical, :flat, :user
  # :total_reviews
  # :average_rating_of_book,
  # :content_rating_of_book, :recommend_rating_of_book,

  # do not need
  # belongs_to :flat, serializer: FlatSerializer
  belongs_to :flat
  belongs_to :user

  # def flat
  #   FlatSerializer.new(object.flat, root: false)
  # end

  # has_many :reviews
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
