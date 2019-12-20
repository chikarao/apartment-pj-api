class ChatMessageCreationEventBroadcastJob < ApplicationJob
  queue_as :default

  # Job is called by a model, in this case, Message model to send message to channels in an array
  def perform(chat_message, channel_names_array)
    # parameters passed from model after_create_commit
    # conversation = Conversation.find_by(id: chat_message.conversation_id)
    # p 'here is the params in Job' + ' ' + params[:room] params does not work
    # p '****** here is the chat_message.attribute_names   in Job' + ' ' + chat_message.attribute_names.to_s
    p '****** here is the channel_names_array in Job' + ' ' + channel_names_array.to_s
    # .broadcast('chat_channel',
    # Calls action cable broadcast for each channel.
    # KEY!! Sender and recipient each have its own channel. Sender creates message which is
    # processed by messages controller then when saved, sent to the sender via AJAX and sent to the
    # recipient via actioncable websocket connnection addressed to the recipient's
    # own chat room. When message is received redux action updates state on the frontend.
    # So, both sender's and recipient's conversation is updated without having to refresh the screen 
    channel_names_array.each do |channel|
      ActionCable
        .server
        .broadcast(channel, chat_message)
    end
  end
end
