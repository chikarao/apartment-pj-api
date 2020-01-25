class Api::V1::ConversationsController < ApplicationController
  before_action :load_conversation, only: [:index, :show, :update, :destroy]
  # before_action :load_flat, only: :show
  before_action :valid_token, only: [:show, :destroy, :create, :update, :update_conversation]

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
    # Creates conversation and a message at the same time
    p "ConversationsController, create, here is conversation params" + conversation_params.to_s
    conversation = Conversation.new conversation_params
    # conversation.flat_id = conversation_params[:flat_id]
    conversation.user_id = conversation_params[:user_id] ? conversation_params[:user_id] : @user.id
    conversation.created_at = DateTime.now
    # only if have parent
    # conversation.book_id = params[:book_id]
    if conversation.save
      message = Message.new(message_params)
      message.conversation_id = conversation.id
      if message.save
        conversation_serializer = parse_json conversation
        json_response "Created conversation and message succesfully", true, {conversation: conversation_serializer}, :ok
      else
        conversation.destroy
        json_response "Create message failed conversation create rolled back", false, {}, :unprocessable_entity
      end
    else
      json_response "Create conversation failed", false, {}, :unprocessable_entity
    end
  end

  def edit
  end

  def update_conversation
    # different update function than conversations#update which is to update messages read
    # receives deleted, trashed arhived params and array of conversation ids;
    # get conversation based on array of conversation ids
    # iterate through each conversation and if params exist for delete trash and archive, take action
    # update each attribute based on conversation id == user id
    # send back same conversations to front end
    #!!! Need to send array of ids as paramenter not conversation paramenters
    @conversations = Conversation.where(id: params[:conversation_id_array])
    @conversations[0].current_user = @user.id
    p "ConversationsController, update_conversation, here is @conversations " + @conversations.to_s
    # !!!! tried present, blank and nil and only nil worked
    # p "update_conversation conversation_update_params[:trashed_by_user].present?: " + conversation_update_params[:trashed_by_user].present?.to_s
    # p "update_conversation conversation_update_params[:deleted].present?: " + conversation_update_params[:deleted].present?.to_s
    # p "update_conversation conversation_update_param?: " + conversation_update_params.to_s
    # p "update_conversation conversation_update_params[:trashed_by_user]: " + conversation_update_params[:trashed_by_user].to_s
    # p "update_conversation conversation_update_params[:deleted]: " + conversation_update_params[:deleted].to_s
    # p "update_conversation conversation_update_params[:deleted].nil?: " + conversation_update_params[:deleted].nil?.to_s
    # p "update_conversation conversation_update_params[:trashed_by_user].nil?: " + conversation_update_params[:trashed_by_user].nil?.to_s
    # p "update_conversation conversation_update_params[:deleted].blank?: " + conversation_update_params[:deleted].blank?.to_s
    # p "update_conversation conversation_update_params[:trashed_by_user].blank?: " + conversation_update_params[:deleted].blank?.to_s

    #
    @conversations.each do |conv|
      # p "update_conversation in each conv.id" + conv.id.to_s
      # if here is deleted_by_user (conv.id == user.id) or deleted
      unless conversation_update_params[:deleted_by_user].nil? || conversation_update_params[:deleted].nil?
        # if conversation.user_id == @user.id ie @user is not owner of flat, mark deleted
        if conv.user_id == @user.id
          # if update is not successful, send failure messagee
          unless conv.update({deleted_by_user: conversation_update_params[:deleted_by_user]})
            json_response "Update conversation failed", false, {}, :unprocessable_entity
          end
        else
        # if owner of flat, mark deleted
        # if update is not successful, send failure messagee
          unless conv.update({deleted: conversation_update_params[:deleted]})
            json_response "Update conversation failed", false, {}, :unprocessable_entity
          end
        end
      end
      #end of if user_id
      # if trashed params are not nil i.e. unless they are nil do below
      unless conversation_update_params[:trashed_by_user].nil? || conversation_update_params[:trashed].nil?
        # if user is conversation uwer update trashed_by_user vs. trashed; by_user is used to filter in front end
        if conv.user_id == @user.id
          # p "!!!!!!!!!if conv update conv.user_id == @user.id"
          unless conv.update({trashed_by_user: conversation_update_params[:trashed_by_user]})
            json_response "Update conversation failed", false, {}, :unprocessable_entity
          end
        else
        # if owner of flat, mark trashed
          unless conv.update({trashed: conversation_update_params[:trashed]})
            json_response "Update conversation failed", false, {}, :unprocessable_entity
          end
        end
        # end of user test
      end
      # end of unless trashed nil

    # if archived params are not nil i.e. unless they are nil do below
      unless conversation_update_params[:archived_by_user].nil? || conversation_update_params[:archived].nil?
        # test for user id = conv.user_id
        if conv.user_id == @user.id
          # mark archived_by_user if conv user_id is user.id
          # send failed message if not updated
          unless conv.update({archived_by_user: conversation_update_params[:archived_by_user]})
            json_response "Update conversation failed", false, {}, :unprocessable_entity
          end
        else
        # if owner of flat, mark archived
          unless conv.update({archived: conversation_update_params[:archived]})
            json_response "Update conversation failed", false, {}, :unprocessable_entity
          end
        end
      end

    end
    # end of each @conversation
    # if conversation_update_params[:deleted_by_user] || conversation_update_params[:deleted]
    #   conversation_serializer = parse_json @conversations
    #   json_response "Updated conversation delete succesfully", true, {conversation: conversation_serializer }, :ok
    # else

    # finally send conversations back; Not sure if need to have some test before sending conversation back since unless will send failures back
      conversation_serializer = parse_json @conversations
      json_response "Updated conversation succesfully", true, {conversation: conversation_serializer }, :ok
    # end
  end

  # user update conversation to mark messages read when user reads messages of conversation
  def update
    # p "ConversationsController, update, here is @conversation" + @conversation.to_s
    @flat = Flat.find_by(id: @conversation.flat_id)
    isOwner = (@flat.user_id == @user.id)
    # p "ConversationsController, update, here is @conversation.user_id " + @conversation.user_id.to_s
    # p "ConversationsController, update, here is isOwner " + isOwner.to_s
    @conversation.current_user = @user.id

    messages = @conversation.messages

    # p "ConversationsController, update, here is messages" + messages.to_s
    messages.each do |message|
      if isOwner
        if message.sent_by_user
          if message.read == false
            message.read = !message.read
            unless message.save
              json_response "Updated message to read for conversation failed", false, {}, :unprocessable_entity
              return
            end
          end # end of message read
        end # end of !message sent by user
      else # else of first if isOwner
        if !message.sent_by_user
          if message.read == false
            message.read = !message.read
            unless message.save
              json_response "Updated message to read for conversation failed", false, {}, :unprocessable_entity
              return
            end
          end #end of if message read
        end
      end #end of if isowner
    end #end of each do message
    conversation_serializer = parse_json @conversation
    delivery_addresses = isOwner ? ["messaging_room_#{@conversation.user_id}"] : ["messaging_room_#{@flat.user_id}"]
    # calling this here does not work since action cable is not yet connected when opening actioncable
    ChatMessageCreationEventBroadcastJob.perform_later({conversation: conversation_serializer.to_json}, delivery_addresses)
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
    # p "!!!!!!params[:id]: " + params[:conversation_id].to_s
    @conversation = Conversation.find_by id: params[:id]
    unless @conversation.present?
      json_response "Cannot find conversation", false, {}, :not_found
    end
  end

  def conversation_params
    params.require(:conversation).permit(:flat_id, :user_id)
  end

  def message_params
    params.require(:message).permit(:body, :sent_by_user)
  end

  def conversation_update_params
    params.require(:conversation).permit(:deleted, :deleted_by_user, :starred, :trashed, :trashed_by_user, :flagged, :archived, :archived_by_user, :important, :office)
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
