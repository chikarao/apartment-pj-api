class Api::V1::Users::ConversationsController < ApplicationController
  #
  #This is for Logined User
  # before_action :authenticate_with_token, only: [:index, :conversation_by_flat, :conversations_by_user_and_flat, :conversations_by_user]
  before_action :valid_token, only: [:index, :conversation_by_flat, :conversations_by_user_and_flat, :conversations_by_user]
  before_action :load_flats, only: [:conversations_by_user]

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
    p 'in users, ConversationsController, conversation_params' + conversation_params.to_s
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

  def conversations_by_user_and_flat
    p 'in users, ConversationsController, conversation_params: ' + conversation_params.to_s
    p 'in users, ConversationsController, @user: ' + @user.to_s
    # Post.where('id = 1').or(Post.where('id = 2'))
    # reference: https://stackoverflow.com/questions/28954500/activerecord-where-field-array-of-possible-values
    @conversations = Conversation.where(user_id: @user.id).or(Conversation.where(conversation_params[:flat_id_array]))
    p 'in users, ConversationsController, conversation_by_user_and_flat, conversations_by_user: ' + @conversations.to_s

    # p @conversation
    if @conversations
      conversations_serializer = parse_json @conversations
      json_response "Fetched conversations by user and flat successfully", true, {conversations: conversations_serializer}, :ok
    else
      json_response "Cannot find conversation for user", false, {}, :not_found
    end
    # @flat = Flat.order(created_at: :desc)
    # @flat = policy_scope(Flat).order(created_at: :desc)

  end

  def conversations_by_user
    # p 'in users, conversations_by_user, conversation_params: ' + conversation_params.to_s
    p 'in users, conversations_by_user, @user: ' + @user.id.to_s
    p 'in users, conversations_by_user, @flats: ' + @flats.to_s
    flat_id_array = []
    @flats.each do |flat|
      flat_id_array.push(flat.id)
      # p flat.to_s
    end
    # Post.where('id = 1').or(Post.where('id = 2'))
    # reference: https://stackoverflow.com/questions/28954500/activerecord-where-field-array-of-possible-values
    @conversations = Conversation.where(user_id: @user.id).or(Conversation.where(flat_id: flat_id_array)).includes(:messages, :user, :flat)
    p 'in users, ConversationsController, conversations_by_user, conversations_by_user: ' + @conversations.to_s

    # p @conversation
    if @conversations
      conversations_serializer = parse_json @conversations
      json_response "Fetched conversations by user successfully", true, {conversations: conversations_serializer}, :ok
    else
      json_response "Cannot find conversation for user", false, {conversations: []}, :not_found
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
end
