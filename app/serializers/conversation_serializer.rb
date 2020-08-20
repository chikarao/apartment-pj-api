class ConversationSerializer < ActiveModel::Serializer
  attributes :id,
  :user_id,
  :flat_id,
  :date_start,
  :date_end,
  :guests,
  :created_at,
  :booking_id,
  :deleted,
  :deleted_by_user,
  :starred,
  :trashed,
  :trashed_by_user,
  :flagged,
  :flagged_by_user,
  :archived,
  :archived_by_user,
  :important,
  :office,
  :messages
  # :flat,
  # :user

  belongs_to :flat
  belongs_to :user

  has_many :messages

end
