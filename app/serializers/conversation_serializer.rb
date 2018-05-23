class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :flat_id, :date_start, :date_end, :guests, :created_at, :booking_id, :messages

  belongs_to :flat
  belongs_to :user

  has_many :messages

end
