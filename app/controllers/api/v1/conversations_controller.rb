class Api::V1::ConversationsController < ApplicationController
  before_action :load_conversation, only: [:index, :show, :update, :destroy]
  # before_action :load_flat, only: :show
  before_action :valid_token, only: [:show, :destroy, :create]

  def index
  end

  def show
    # @conversation = Conversation.find_by(user_id: params[:user_id], flat_id: params[:flat_id])
    conversation_serializer = parse_json @conversation
    json_response "Showed conversation successfully", true, {conversation: conversation_serializer}, :ok

  end

  def new
  end

  def create
    p "ConversationsController, create, here is conversation params" + conversation_params.to_s
    conversation = Conversation.new conversation_params
    # conversation.flat_id = conversation_params[:flat_id]
    conversation.user_id = @user.id
    conversation.created_at = DateTime.now
    # only if have parent
    # conversation.book_id = params[:book_id]
    if conversation.save
      conversation_serializer = parse_json conversation
      json_response "Created conversation succesfully", true, {conversation: conversation_serializer}, :ok
    else
      json_response "Create conversation failed", false, {}, :unprocessable_entity
    end
  end

  def edit
  end

  # user update conversation to mark messages read when user reads messages of conversation
  def update
    p "ConversationsController, update, here is @conversation" + @conversation.to_s
    p "ConversationsController, update, here is @conversation.user_id" + @conversation.user_id.to_s
    messages = @conversation.messages
    p "ConversationsController, update, here is messages" + messages.to_s
    messages.each do |message|
      if message.read == false
        message.read = true
        unless message.save
          json_response "Updated message to read for conversation failed", false, {}, :unprocessable_entity
          return
        end
      end
    end
    conversation_serializer = parse_json @conversation
    json_response "Updated messages to read for conversation successfully", true, {conversation: conversation_serializer}, :ok
  end

  def destroy
    # if @user.id = current_user.id
    #   #delete the image on cloudinary too
    #   publicid= @image.publicid
    #   if @image.destroy
    #     result = Cloudinary::Uploader.destroy(publicid)
    #     json_response "Deleted image succesfully", true, {image: @image, cloudinary_result: result}, :ok
    #     json_response "Deleted image succesfully", true, {image: @image}, :ok
    #   else
    #     json_response "Delete image failed", false, {}, :unprocessable_entity
    #   end
    # else
    #   json_response "Delete image failed", false, {}, :unprocessable_entity
    # end
  end

  private

  def load_conversation
    # front end gets params and sends it in fetchFlatFromParams
    @conversation = Conversation.find_by id: params[:id]
    unless @conversation.present?
      json_response "Cannot find conversation", false, {}, :not_found
    end
  end

  def conversation_params
    params.require(:conversation).permit(:flat_id)
  end

  # def load_flat
  #   # front end gets params and sends it in fetchFlatFromParams
  #   @flat = Flat.find_by id: params[:id]
  #   unless @flat.present?
  #     json_response "Cannot find flat", false, {}, :not_found
  #   end
  # end

  def valid_token
    @user = User.find_by authentication_token: request.headers["AUTH-TOKEN"]
    if @user
      return @user
    else
      json_response "Invalid token", false, {}, :failure
    end
  end
end
