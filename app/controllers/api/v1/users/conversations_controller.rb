class Api::V1::Users::ConversationsController < ApplicationController
  #
  #This is for Logined User
  before_action :valid_token, only: [:index, :conversation_by_flat]
  before_action :authenticate_with_token, only: [:index]

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
    @conversation = Conversation.where(user_id: @user.id, flat_id: conversation_params[:id])
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

  def conversation_params
    params.require(:conversation).permit(:id)
  end

  def valid_token
    @user = User.find_by authentication_token: request.headers["AUTH-TOKEN"]
    if @user
      return @user
    else
      json_response "Invalid token", false, {}, :failure
    end
  end
end
