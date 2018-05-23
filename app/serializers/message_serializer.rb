class MessageSerializer < ActiveModel::Serializer
  attributes :id, :conversation_id, :subject, :body, :read, :replied, :flag, :created_at

  belongs_to :conversation

end
