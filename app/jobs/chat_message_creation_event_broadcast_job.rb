class ChatMessageCreationEventBroadcastJob < ApplicationJob
  queue_as :default

  def perform(chat_message, channel_names_array)
    # parameters passed from model after_create_commit
    # conversation = Conversation.find_by(id: chat_message.conversation_id)
    # p 'here is the params in Job' + ' ' + params[:room] params does not work
    # p '****** here is the chat_message.attribute_names   in Job' + ' ' + chat_message.attribute_names.to_s
    p '****** here is the channel_names_array in Job' + ' ' + channel_names_array.to_s
    # .broadcast('chat_channel',
    channel_names_array.each do |channel|
      ActionCable
        .server
        .broadcast(channel, chat_message)
    end
  end
end
