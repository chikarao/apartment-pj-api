# reference: http://jameshuynh.com/rails/react%20js/chat/2017/07/30/build-chat-using-react-js-and-rails-action-cable/
# UserStatus in concerns/user_status for creating and upding redis hash
include UserStatus


class ChatChannel < ApplicationCable::Channel
  # Reference: https://edgeapi.rubyonrails.org/classes/ActionCable/Channel/Base.html#method-i-unsubscribed
  # https://stackoverflow.com/questions/39815216/how-to-terminate-subscription-to-an-actioncable-channel-from-server
  # periodically :transmit_progress, every: 5.seconds

  #periodically every: 5.seconds do
    # transmit action: :update_count, count: current_count
  #  p 'It has been 5 seconds!!!!!'
  #end

  # transmit(data, via: nil)

  def subscribed
    p '**** chat_channel subscribed params[:room]' + ' ' + params[:room].to_s
    # array = params[:room].split('_')
    # p '**** chat_channel subscribed array' + ' ' + array.to_s
    # stream_from 'chat_channel'
    stream_from params[:room]
  end

 def message(m)
   p '**** ChatChannel pinged in message' + ' ' + m.to_s
 end

 def typing(hash)
   # data hash has user_id the message sender, and addressee_id, the intended recipient
   # data is a hash of {user_id: x, addressee_id: y}
   # set user activity; If user types online becomes true
   # user_hash = get_user_status_by_user_id(params_hash["user_id"].to_i)
   set_last_user_activity({user_id: hash["user_id"], logged_in: true, online: true, keep_online_status: false})
   notification = {notification: 'typing', user_id: hash["user_id"] }
   ActionCable.server.broadcast("messaging_room_#{hash["addressee_id"]}", notification)
 end

#  def ping
#    p '**** ChatChannel pinged in ping'
#  end

  def unsubscribed
    # This will broadcast that user unsubscribed but the frontend will not receive the final broadcast
    p '**** ChatChannel unsubscribed'
    notification = {notification: 'User X has dropped off'}
    # ActionCable.server.broadcast(params[:room], notification)
    send_broadcast(params[:room], notification)
  end

  def unsubscribe_connection()
    # *********This is not used
    notification = {notification: 'The messaging connection is disconnecting'}
    # ActionCable.server.broadcast(params[:room], notification)
    # send_broadcast(params[:room], notification)
    # transmits just to subscriber; Broadcast transmits to all subscribers?
    transmit(notification)
    reject_subscription # problem is that reject sends a reject message not a custom one
    # unsubscribe # does not work
    #disconnect # does not work
  end

  def authenticated(params_hash)
    # An authntication token is sent from frontend after websocket connection is established,
    # since we do not want to send the token in an URL. Token is validated by finding user
    # with the token. If no user, the connection is rejected and closed.
    # p '**** ChatChannel authenticated, token:' + ' ' + token.to_s
    # p '**** ChatChannel authenticated, token[:token]:' + ' ' + token["token"].to_s
    # parsed_token = JSON.parse(token)
    # p '**** ChatChannel authenticated, token[:token]:' + ' ' + parsed_token[:token].to_s
    # Find user by authntication token (needs to be encrypted!!!!!!)
    user = User.find_by(authentication_token: params_hash["token"])
    # if user with the authntication token exists, positive notification sent to front end
    if user
      # create hash for user_status for user in $redis
      # passes user id; the user must be logged in and online
      user_status_hash = {online: false}
      other_user_hash = nil
      result = set_last_user_activity({user_id: user.id, logged_in: true, online: false, keep_online_status: true})
      # p '**** ChatChannel authenticated, result:' + result.to_s
      if result
        user_status_hash = get_user_status_by_user_id(user.id)
      end

      if params_hash["other_user_id"]
        other_user_hash = get_user_status_by_user_id(params_hash["other_user_id"].to_i)
      end

      # p '******* redis chat_channel params_hash ' + params_hash.to_s
      if params_hash["expiration"]
        connection_result = set_connections({ user_ids: [user.id, params_hash["other_user_id"]], expiration: params_hash["expiration"]})
        # connection_result = set_connections({ user_ids: [user.id, 3], expiration: params_hash["expiration"]})
        # p '******* redis chat_channel connection_result ' + connection_result.to_s
      end
      notification = {notification: 'authenticated', user_status: user_status_hash, other_user_status: [other_user_hash]}
      notification_all = {notification: 'User X has connected'}
      # transmits just to subscriber; Broadcast transmits to all subscribers?
      transmit(notification)
      send_broadcast(params[:room], notification_all)
      # ActionCable.server.broadcast(params[:room], notification)
    p '******* Welcome to Actioncable Messaging Streaming from ' + params[:room].to_s + ' *******'
    else
      #if no user with authntication token, reject subscription; Reject notification sent in native method rejected in createSocket in front end
      notification = {notification: 'Connection request has been rejected'}
      transmit(notification)
      reject_subscription
    end
  end
 # This is not used but save for now for reference
  # def create(opts)
  #   # !!!!! NOT USED. Messages and conversations are created in their controllers via ajax call from frontend
  #   # Do not need to use this create function for message as
  #   # action Controller is wathing out for any messages created in Message model
  #   # pubsub = ActionCable.server.pubsub
  #   # channel_with_prefix = pubsub.send(:channel_with_prefix, ChatChannel.channel_name)
  #   # p 'Here is the channel_with_prefix' + ' ' + channel_with_prefix.to_s
  #   # chnage this to conversation.create
  #   # User.create({ :first_name => 'Jamie', :is_admin => true }, :without_protection => true)
  #   message = Message.new
  #   # message.body = opts.fetch('content')
  #   message.body = opts.fetch('content')
  #   message.conversation_id = 44
  #   p 'Here is the new message' + ' ' + message.body.to_s
  #   p 'Here is the params' + ' ' + params[:room]
  #   message.save
  #   # Message.create( {
  #   #   :body => opts.fetch('content'),
  #   #   :conversation_id => 44
  #   # }, :without_protection => true
  #   # )
  # end

  private

  def send_broadcast(address, notification)
    ActionCable.server.broadcast(params[:room], notification)
  end

end
