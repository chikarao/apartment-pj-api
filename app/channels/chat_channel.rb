# reference: http://jameshuynh.com/rails/react%20js/chat/2017/07/30/build-chat-using-react-js-and-rails-action-cable/
class ChatChannel < ApplicationCable::Channel

  # periodically :transmit_progress, every: 5.seconds

  #periodically every: 5.seconds do
    # transmit action: :update_count, count: current_count
  #  p 'It has been 5 seconds!!!!!'
  #end

  def subscribed
    # stream_from 'chat_channel'
    stream_from params[:room]
  end

  def unsubscribed
    p '**** ChatChannel unsubscribed'
  end

  def authenticated(token)
    p '**** ChatChannel authenticated, token:' + ' ' + token.to_s
    # parsed_token = JSON.parse(token)
    # p '**** ChatChannel authenticated, token[:token]:' + ' ' + parsed_token[:token].to_s
    p '**** ChatChannel authenticated, token[:token]:' + ' ' + token["token"].to_s
    user = User.find_by(authentication_token: token["token"])
    # user = nil
    p '**** ChatChannel authenticated, token:' + ' ' + token.to_s + ' User ID: ' + user.id.to_s
    if user
    p '******* Welcome to Actioncable Messaging Streaming from ' + params[:room].to_s + ' *******'
    else
      reject_subscription
    end
  end

  def create(opts)
    # Do not need to use this create function for message as
    # action Controller is wathing out for any messages created in Message model
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
