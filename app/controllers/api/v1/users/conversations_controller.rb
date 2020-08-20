# require_dependency "application_controller"

class Api::V1::Users::ConversationsController < ApplicationController
  # include ::UserStatus
  #This is for Loggedin User
  # before_action :authenticate_with_token, only: [:index, :conversation_by_flat, :conversations_by_user_and_flat, :conversations_by_user]
  before_action :valid_token, only: [:index, :conversation_by_flat, :conversations_by_user_and_flat, :conversations_by_user]
  # before_action :load_flats, only: [:conversations_by_user]

  def index
    # p 'in users, BookingsController'
    @conversations = Conversation.where(user_id: @user.id)
    # p @conversations
    if @conversations
      conversations_serializer = parse_json @conversations
      json_response "Indexed user's conversations successfully", true, {conversations: conversations_serializer}, :ok
    else
      json_response "Cannot find conversations for user", false, {}, :not_found
    end
    # @flat = Flat.order(created_at: :desc)
    # @flat = policy_scope(Flat).order(created_at: :desc)

     # authorize @cars
  end

  def conversation_by_flat
    # p 'in users, ConversationsController, conversation_params' + conversation_params.to_s
    @conversation = Conversation.where(user_id: @user.id, flat_id: conversation_params[:flat_id])
    # p @conversation
    if @conversation
      conversation_serializer = parse_json @conversation
      json_response "Fetched user's conversation by flat successfully", true, {conversation: conversation_serializer}, :ok
    else
      json_response "Cannot find conversation for user", false, {}, :not_found
    end
    # @flat = Flat.order(created_at: :desc)
    # @flat = policy_scope(Flat).order(created_at: :desc)

     # authorize @cars
  end
  # conversations_by_user_and_flat NOT used in frontend
  # deprecated for conversations_by_user
  # def conversations_by_user_and_flat
  #   # p 'in users, ConversationsController, conversation_params: ' + conversation_params.to_s
  #   # p 'in users, ConversationsController, @user: ' + @user.to_s
  #   # Post.where('id = 1').or(Post.where('id = 2'))
  #   # reference: https://stackoverflow.com/questions/28954500/activerecord-where-field-array-of-possible-values
  #   @conversations = Conversation.where(user_id: @user.id).or(Conversation.where(conversation_params[:flat_id_array]))
  #   # p 'in users, ConversationsController, conversation_by_user_and_flat, conversations_by_user: ' + @conversations.to_s
  #
  #   # p @conversation
  #   if @conversations
  #     conversations_serializer = parse_json @conversations
  #     json_response "Fetched conversations by user and flat successfully", true, {conversations: conversations_serializer}, :ok
  #   else
  #     json_response "Cannot find conversation for user", false, {}, :not_found
  #   end
  #   # @flat = Flat.order(created_at: :desc)
  #   # @flat = policy_scope(Flat).order(created_at: :desc)
  #
  # end
  # called in header.js and messaging_main.js in frontend
  def conversations_by_user
    # p 'in users, conversations_by_user, @user: ' + @user.id.to_s
    # p 'in users, conversations_by_user, @flats: ' + @flats.to_s
    # DO NOT use before_action load_flats since that would render a 404 Not found error
    # Get flats in action
    # @flats = Flat.where(user_id: @user.id)
    # get ids of flats with user_id equal to current current @user
    flat_id_array = []
    user_status_hash_array = []
    # pluck gets just array of ids of flats belonging to @user
    flat_id_array = Flat.where(user_id: @user.id).pluck(:id)
    # check if
    if !flat_id_array.empty?
      # get user's flats and push ids in array
    # if @flats
      # flat_id_array = []
      # @flats.each do |flat|
      #   flat_id_array.push(flat.id)
      #   # p flat.to_s
      # end
      # Post.where('id = 1').or(Post.where('id = 2'))
      # reference: https://stackoverflow.com/questions/28954500/activerecord-where-field-array-of-possible-values
      # @conversations = Conversation.where(user_id: @user.id, deleted: false).or(Conversation.where(flat_id: flat_id_array, deleted: false)).includes(:messages, :user, :flat)
      # @conversations = Conversation.where(user_id: @user.id).or(Conversation.where(flat_id: flat_id_array)).includes(:messages, :user, :flat)
      conversations = Conversation.where(user_id: @user.id).or(Conversation.where(flat_id: flat_id_array))
      # p 'in users, ConversationsController, conversations_by_user, conversations, conversations.user_id: ' + conversations.to_s + ' ' + conversations[0].user_id.to_s

      # p @conversation
      if conversations
        if $redis
          user_status_hash_array = get_set_status_of_conversation_users(@user.id, conversations)
          # if user_status_hash_array.blank?
          #   p '**********in users, conversations_by_user, user_status_hash_array, user_status_hash_array.blank?: ' + user_status_hash_array.to_s + ' ' +  user_status_hash_array.blank?.to_s
          #   result_set = set_status_of_conversation_users(@user.id, conversations)
          #   if result_set
          #     user_status_hash_array = get_set_status_of_conversation_users(@user.id, conversations)
          #   end
          # end
          # p '**********in users, conversations_by_user, user_status_hash_array, user_status_hash_array.blank?: ' + user_status_hash_array.to_s + ' ' +  user_status_hash_array.blank?.to_s
        end
        conversations_serializer = parse_json conversations
        # p 'in users, ConversationsController, conversations_by_user, conversations, conversations.user_id last: ' + conversations.to_s + ' ' + conversations[0].user_id.to_s
        json_response "Fetched conversations by user successfully", true, {conversations: conversations_serializer, other_user_status: user_status_hash_array, test_conversations: conversations.to_json}, :ok
      else
        json_response "Cannot find conversation for user", false, {conversations: []}, :not_found
        # json_response "Cannot find conversation for user", false, {conversations: []}, :not_found
      end
    else # flat_id_array.empty
      # @conversations = Conversation.where(user_id: @user.id, deleted: false).or(Conversation.where(flat_id: flat_id_array, deleted: false)).includes(:messages, :user, :flat)
      @conversations = Conversation.where(user_id: @user.id).includes(:messages, :user, :flat)
      # p 'in users, ConversationsController, conversations_by_user, no flats conversations_by_user: ' + @conversations.to_s

      # p @conversation
      if @conversations
        if $redis
          user_status_hash_array = get_set_status_of_conversation_users(@user.id, @conversations)
          # p '**********in users, conversations_by_user, if flat id empty user_status_hash_array: ' + user_status_hash_array.to_s
        end
        conversations_serializer = parse_json @conversations
        json_response "Fetched conversations by user successfully", true, {conversations: conversations_serializer, other_user_status: user_status_hash_array}, :ok
      else
        json_response "Cannot find conversation for user", false, {conversations: []}, :not_found
        # json_response "Cannot find conversation for user", false, {conversations: []}, :not_found
      end

    end
    # @flat = Flat.order(created_at: :desc)
    # @flat = policy_scope(Flat).order(created_at: :desc)
  end



  # def show
  #   @car = Car.find(params[:id])
  #
  #   @hash = Gmaps4rails.build_markers(@car) do |car, marker|
  #     marker.lat car.latitude
  #     marker.lng car.longitude
  #     # marker.infowindow render_to_string(partial: "/cars/map_box", locals: { car: car })
  #   end
  # end
  #
  #
  #
  # def create
  # end
  private

  def load_flats
    # front end gets params and sends it in fetchFlatFromParams
    # returns hash
    # @flats = Flat.find_by user_id: @user.id
    # returns array
    @flats = Flat.where(user_id: @user.id)
    # p 'in users, load_flats, @flats: ' + @flats.to_s
    unless @flats.present?
      json_response "Cannot find any flats for user", false, {}, :not_found
    end
  end

  # reference for passing array in params https://jaketrent.com/post/permit-array-rails-strong-parameters/
  def conversation_params
    params.require(:conversation).permit(:flat_id, flat_id_array: [])
  end

  def valid_token
    @user = User.find_by authentication_token: request.headers["AUTH-TOKEN"]
    # p 'in users, ConversationsController, valid_token, request.headers["AUTH-TOKEN"]: ' + request.headers["AUTH-TOKEN"].to_s

    if @user
      return @user
    else
      json_response "Invalid token", false, {}, :failure
    end
  end
  # Deprecated
  # def set_status_of_conversation_users(user_id, conversations)
  #   conversations.each do |conv|
  #     if conv.user_id != user_id
  #       flat_owner_id = Flat.find_by(id: conv.flat_id).user_id
  #       user_status_hash = get_user_status_by_user_id(flat_owner_id)
  #       result = set_last_user_activity({user_id: flat_owner_id, logged_in: false, online: false, keep_online_status: false}) if user_status_hash.blank?
  #     else
  #       result = set_last_user_activity({user_id: user_id, logged_in: false, online: false, keep_online_status: false})
  #     end
  #     break unless result
  #   end # end each conversations
  #   return true
  # end

  def get_set_status_of_conversation_users(user_id, conversations)
    conversation_user_id_array = []
    user_status_hash_array = []

    conversations.each do |conv|
      if conv.user_id != user_id
        # p '**********in users, get_set_status_of_conversation_users, conv: ' + conv.to_s
        # p '**********in users, get_set_status_of_conversation_users, conv.flat_id: ' + conv.flat_id.to_s
        flat_owner_user_id = Flat.find_by(id: conv.flat_id).user_id
        conversation_user_id_array.push(flat_owner_user_id)
      else
        conversation_user_id_array.push(conv.user_id)
      end # end of if
    end # end of each

    # p '**********in users, get_set_status_of_conversation_users, conversation_user_id_array: ' + conversation_user_id_array.to_s
    conversation_user_id_array.each do |each_id|
      user_status_hash = get_user_status_by_user_id(each_id)
      if user_status_hash.blank?
        result = set_last_user_activity({user_id: each_id, logged_in: false, online: false, keep_online_status: false})
        user_status_hash = get_user_status_by_user_id(each_id)
        user_status_hash_array.push(user_status_hash) unless user_status_hash.blank?
      else
        user_status_hash_array.push(user_status_hash) unless user_status_hash.blank?
      end
    end
    return user_status_hash_array
  end # end of get_set_status_of_conversation_users

end # end of Class
