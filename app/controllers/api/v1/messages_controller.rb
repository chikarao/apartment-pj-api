class Api::V1::MessagesController < ApplicationController
  before_action :load_flat, only: [:show, :destroy]
  before_action :load_conversation, only: [:create, :destroy]
  # before_action :load_image, only: :destroy
  before_action :valid_token, only: [:destroy, :create]
  # before_action :authenticate_with_token, only: [:create, :update, :destroy]

  # def index
  # end
  #
  # def show
  # end
  #
  # def new
  # end
  # create for user to send message. Right now not allowing edit or delete of message
  def create
    # p "MessagesController, create, here is message params" + message_params.to_s
    message = Message.new message_params
    message.created_at = DateTime.now
    # only if have parent
    if message.save
      # even if user or owner had deleted the conversation (marked it deleted or deleted_by_user = true),
      # if one side responds to the message, the conversation accessible to user who deleted it (ie deleted and deleted_by_user = false)
      @conversation.deleted = false
      @conversation.deleted_by_user = false
      @conversation.trashed = false
      @conversation.trashed_by_user = false
      @conversation.archived = false
      @conversation.archived_by_user = false
      @conversation.save
      # message_serializer = parse_json message
      conversation_serializer = parse_json @conversation
      json_response "Created message succesfully", true, {conversation: conversation_serializer}, :ok
    else
      # p "MessagesController, create, in if else " + message.to_s
      json_response "Create message failed", false, {}, :unprocessable_entity
    end
  end

  # def edit
  # end
  #
  # def update
  # end

  # def destroy
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
  # end

  private

  def load_flat
    # front end gets params and sends it in fetchFlatFromParams
    @flat = Flat.find_by id: message_params[:flat_id]
    # p "MessagesController, load_flat, message_params[:flat_id]:  " + message_params[:flat_id].to_s
    unless @flat.present?
      json_response "Cannot find flat", false, {}, :not_found
    end
  end

  def load_conversation
    # front end gets params and sends it in fetchFlatFromParams
    @conversation = Conversation.find_by id: message_params[:conversation_id]
    # p "MessagesController, load_conversation, message_params[:conversation_id]:  " + message_params[:conversation_id].to_s
    unless @conversation.present?
      json_response "Cannot find conversation", false, {}, :not_found
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
