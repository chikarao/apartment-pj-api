class MessageSerializer < ActiveModel::Serializer
  attributes :id, :conversation_id, :subject, :body, :read, :replied, :flag, :sent_by_user, :created_at, :conversation

  belongs_to :conversation

end
