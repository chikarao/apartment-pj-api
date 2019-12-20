# reference: http://jameshuynh.com/rails/react%20js/chat/2017/07/30/build-chat-using-react-js-and-rails-action-cable/
class ChatChannel < ApplicationCable::Channel
  def subscribed
    # stream_from 'chat_channel'
    stream_from params[:room]
  end

  def unsubscribed
    p '**** ChatChannel unsubscribed'
  end

  def create(opts)
    # pubsub = ActionCable.server.pubsub
    # channel_with_prefix = pubsub.send(:channel_with_prefix, ChatChannel.channel_name)
    # p 'Here is the channel_with_prefix' + ' ' + channel_with_prefix.to_s
    # chnage this to conversation.create
    # User.create({ :first_name => 'Jamie', :is_admin => true }, :without_protection => true)
    message = Message.new
    # message.body = opts.fetch('content')
    message.body = opts.fetch('content')
    message.conversation_id = 44
    p 'Here is the new message' + ' ' + message.body.to_s
    p 'Here is the params' + ' ' + params[:room]
    message.save
    # Message.create( {
    #   :body => opts.fetch('content'),
    #   :conversation_id => 44
    # }, :without_protection => true
    # )
  end

end
