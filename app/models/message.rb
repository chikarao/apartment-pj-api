class Message < ApplicationRecord
  require "action_controller"
  require "action_controller/serialization"
  require "#{Rails.root}/app/serializers/conversation_serializer.rb"
  attr_accessor :current_user
  belongs_to :conversation
    # after_create_commit is fired when a Message instance is committed by saving to DB
   after_create_commit do
     # gets conversation associated with new Message
     conversation = Conversation.find_by(id: self.conversation_id)
     # booking = Booking.find_by(id: 2452)
     # serializes and jsons conversation to be sent along with other associations
     conversation_serializer = ConversationSerializer.new(conversation).to_json
    # if self.sent_by_user && conversation.user_id != conversation.flat.user_id
     #end
    # current_user = User.current_user
    # sent by user denotes tenant so needs to be delivered to owner
    if self.sent_by_user
    # Defineds addresses for the new Message to be sent in an array of relevant addresses
      delivery_addresses = ["messaging_room_#{conversation.flat.user_id}"]
    else
    # message was not sent by user means sent by owner so needs to be sent to tenant
    # conversation user_id is the tenant (proposed or otherwise)
    # conversations are started by tenant user
      delivery_addresses = ["messaging_room_#{conversation.user_id}"]
    end

     p 'In message model self' + ' ' + self.body.to_s
     p 'In message model current_user' + ' ' + ' ' + self.current_user.to_s
     p 'In message model delivery_addresses' + ' ' + ' ' + delivery_addresses.to_s

     # p 'In message model conversation.id' + ' ' + conversation.id.to_s
     # p 'In message model message_serializer' + ' ' + message_serializer.to_s
     # p 'In message model conversation_serializer.class' + ' ' + conversation_serializer.class.to_s
     # message_serializer.to_json
     # test to see if channel name can be passed to ChatMessageCreationEventBroadcastJob
    # ChatMessageCreationEventBroadcastJob.perform_later(message_serializer.to_json, ['test_room', 'test_room2'])
    # ChatMessageCreationEventBroadcastJob.perform_later(self, ['test_room', 'test_room2'])
    # ChatMessageCreationEventBroadcastJob.perform_later(conversation_serializer, ['test_room', 'test_room2'])
    # Calls job class to send conversation through chat channels
    ChatMessageCreationEventBroadcastJob.perform_later({conversation: conversation_serializer}, delivery_addresses)
   end

   after_save do
     conversation = Conversation.find_by(id: self.conversation_id)
     conversation_serializer = ConversationSerializer.new(conversation).to_json
     delivery_addresses = ["messaging_room_#{conversation.flat.user_id}"]
     ChatMessageCreationEventBroadcastJob.perform_later({conversation: conversation_serializer}, delivery_addresses)
   end

end
