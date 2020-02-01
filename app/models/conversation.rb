class Conversation < ApplicationRecord
  require "action_controller"
  require "action_controller/serialization"
  require "#{Rails.root}/app/serializers/conversation_serializer.rb"
  # requires attr_accessor so that conversations controller can assign to user making the api request
  attr_accessor :current_user

  belongs_to :user
  belongs_to :flat
  # ****************************************
  # IMPORTANT NOTE: Covnersation user_id is for non-flatowner users.
  # Flat owner users' id is set in conversation.flat.user_id
  # Messages attached to conversations are identified by sent_by_user: true, which means conversation.user_id sent it
  # ****************************************

  has_many :messages, dependent: :destroy

  after_update do
    p 'In conversation model after update self' + ' ' + self.trashed.to_s
    p 'In conversation model after update self' + ' ' + self.archived.to_s

    # conversation = Conversation.find_by(id: self.conversation_id)
    conversation_serializer = ConversationSerializer.new(self).to_json
    if self.current_user = self.user_id
      delivery_addresses = ["messaging_room_#{self.flat.user_id}"]
    else
      delivery_addresses = ["messaging_room_#{self.user_id}"]
    end
    ChatMessageCreationEventBroadcastJob.perform_later({conversation: conversation_serializer}, delivery_addresses)
  end
end
