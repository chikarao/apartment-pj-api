class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :flat_id, :booking_id, :user_id, :title, :comment, :rating, :created_at, :updated_at, :booking, :user

  belongs_to :user
  # belongs_to :flat
  belongs_to :booking
end
