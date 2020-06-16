class ProgressCreationEventBroadcastJob < ApplicationJob
  queue_as :default

  # Job is called by a model, in this case, Message model to send message to channels in an array
  def perform(progress_payload_object, channel)
    # parameters passed from model after_create_commit
    # conversation = Conversation.find_by(id: progress_payload_object.conversation_id)
    # p 'here is the params in Job' + ' ' + params[:room] params does not work
    # p '****** here is the progress_payload_object.attribute_names   in Job' + ' ' + progress_payload_object.attribute_names.to_s
    # p '****** here is the progress_payload_object, channel in Job' + progress_payload_object.to_s + ' ' + channel.to_s
    # p '****** here is the progress_payload_object in Job' + ' ' + progress_payload_object.to_s
    # .broadcast('chat_channel',
    # Calls action cable broadcast for each channel.
    # KEY!! Sender and recipient each have its own channel. Sender creates message which is
    # processed by messages controller then when saved, sent to the sender via AJAX and sent to the
    # recipient via actioncable websocket connnection addressed to the recipient's
    # own chat room. When message is received redux action updates state on the frontend.
    # So, both sender's and recipient's conversation is updated without having to refresh the screen
    # channel_names_array.each do |channel|
      p '****** in Job each channel, progress_payload_object: ' + channel.to_s + ' ' + progress_payload_object.to_s
      ActionCable.server.broadcast(channel, progress_payload_object)
    # end
  end
end
