class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :comment, :rating, :created_at, :updated_at, :booking, :user

  belongs_to :user
  # belongs_to :flat
  belongs_to :booking
end
