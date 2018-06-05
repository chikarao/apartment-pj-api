class LikeSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :flat_id, :flat, :user

  belongs_to :flat
  belongs_to :user

end
