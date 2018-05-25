class Api::V1::MessagesController < ApplicationController
  before_action :load_flat, only: [:show, :destroy]
  # before_action :load_image, only: :destroy
  before_action :valid_token, only: [:destroy, :create]
  # before_action :authenticate_with_token, only: [:create, :update, :destroy]

  def index
  end

  def show
  end

  def new
  end

  def create
    p "MessagesController, create, here is message params" + message_params.to_s
    message = Message.new message_params
    message.created_at = DateTime.now
    # only if have parent
    if message.save
      message_serializer = parse_json message
      json_response "Created message succesfully", true, {message: message_serializer}, :ok
    else
      p "MessagesController, create, in if else " + message.to_s
      json_response "Create message failed", false, {}, :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
    # if @user.id = current_user.id
    #   #delete the message on cloudinary too
    #   publicid= @message.publicid
    #   if @message.destroy
    #     json_response "Deleted message succesfully", true, {message: @message}, :ok
    #   else
    #     json_response "Delete message failed", false, {}, :unprocessable_entity
    #   end
    # else
    #   json_response "Delete message failed", false, {}, :unprocessable_entity
    # end
  end

  private

  def load_flat
    # front end gets params and sends it in fetchFlatFromParams
    @flat = Flat.find_by id: message_params[:flat_id]
    p "MessagesController, load_flat, message_params[:flat_id]:  " + message_params[:flat_id].to_s
    unless @flat.present?
      json_response "Cannot find flat", false, {}, :not_found
    end
  end

  def message_params
    params.require(:message).permit(:conversation_id, :subject, :body, :read, :replied, :flag, :sent_by_user)
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
