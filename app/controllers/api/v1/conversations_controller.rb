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

  def update_conversation
    #!!! Need to send array of ids as paramenter not conversation paramenters
    @conversations = Conversation.where id: params[:conversation_id_array]
    # p "update_conversation conversation_update_params[:trashed_by_user].present?: " + conversation_update_params[:trashed_by_user].present?.to_s
    # p "update_conversation conversation_update_params[:deleted].present?: " + conversation_update_params[:deleted].present?.to_s
    # p "update_conversation conversation_update_param?: " + conversation_update_params.to_s
    # p "update_conversation conversation_update_params[:trashed_by_user]: " + conversation_update_params[:trashed_by_user].to_s
    # p "update_conversation conversation_update_params[:deleted]: " + conversation_update_params[:deleted].to_s
    # p "update_conversation conversation_update_params[:deleted].nil?: " + conversation_update_params[:deleted].nil?.to_s
    # p "update_conversation conversation_update_params[:trashed_by_user].nil?: " + conversation_update_params[:trashed_by_user].nil?.to_s
    # p "update_conversation conversation_update_params[:deleted].blank?: " + conversation_update_params[:deleted].blank?.to_s
    # p "update_conversation conversation_update_params[:trashed_by_user].blank?: " + conversation_update_params[:deleted].blank?.to_s

    # p "!!!! conversation_update_params: " + conversation_update_params.to_s
    # p "!!!! @conversations: " + @conversations.to_s
    conversations_without_deleted = []
    @conversations.each do |conv|
      # p "update_conversation in each conv.id" + conv.id.to_s
      # if here is deleted_by_user (conv.id == user.id) or deleted
      unless conversation_update_params[:deleted_by_user].nil? || conversation_update_params[:deleted].nil?
        # if conversation.user_id == @user.id ie @user is not owner of flat, mark deleted
        if conv.user_id == @user.id
          if conv.update({deleted_by_user: conversation_update_params[:deleted_by_user]})
            # conversations_without_deleted = []
            # @conversations.each do |each|
            #   if !each.deleted_by_user
            #     conversations_without_deleted << each
            #   end
            # end
            # conversation_serializer = parse_json conversations_without_deleted
            # json_response "Updated conversation succesfully", true, {conversation: conversation_serializer }, :ok
          else
            json_response "Update conversation failed", false, {}, :unprocessable_entity
          end
        else
        # if owner of flat, mark deleted
          if conv.update({deleted: conversation_update_params[:deleted]})
            # conversations_without_deleted = []
            # @conversations.each do |each|
            #   if !each.deleted
            #     conversations_without_deleted << each
            #   end
            # end
            # conversation_serializer = parse_json conversations_without_deleted
            # json_response "Updated conversation succesfully", true, {conversation: conversation_serializer }, :ok
          else
          json_response "Update conversation failed", false, {}, :unprocessable_entity
          end
        end
      end
        #end of if user_id
      unless conversation_update_params[:trashed_by_user].nil? || conversation_update_params[:trashed].nil?
        # p "!!!!!!!!!if conversation_update_params[:trashed_by_user]: " + conversation_update_params[:trashed_by_user].to_s
        if conv.user_id == @user.id
          # p "!!!!!!!!!if conv update conv.user_id == @user.id"
          unless conv.update({trashed_by_user: conversation_update_params[:trashed_by_user]})
            json_response "Update conversation failed", false, {}, :unprocessable_entity
          end
        else
          # p "!!!!!!!!!!!!if conv update conv.user_id != @user.id"
        # if owner of flat, mark trashed
          unless conv.update({trashed: conversation_update_params[:trashed]})
            json_response "Update conversation failed", false, {}, :unprocessable_entity
          end
        end
      end

    unless conversation_update_params[:archived_by_user].nil? || conversation_update_params[:archived].nil?
      if conv.user_id == @user.id
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

      # end of if params deleted
      #REPEAT for archived and trashed ()
    end
    # end of each @conversa
    # unless conversation_update_params[:deleted_by_user] || conversation_update_params[:deleted]
    #   p "!!!!!!!!!!!! conv update conv.user_id != @user.id"
    # end

    if conversation_update_params[:deleted_by_user] || conversation_update_params[:deleted]
      conversation_serializer = parse_json @conversations
      json_response "Updated conversation delete succesfully", true, {conversation: conversation_serializer }, :ok
    else
      conversation_serializer = parse_json @conversations
      json_response "Updated conversation succesfully", true, {conversation: conversation_serializer }, :ok
    end
  end



  # user update conversation to mark messages read when user reads messages of conversation
  def update
    # p "ConversationsController, update, here is @conversation" + @conversation.to_s
    @flat = Flat.find_by(id: @conversation.flat_id)
    isOwner = (@flat.user_id == @user.id)
    p "ConversationsController, update, here is @conversation.user_id" + @conversation.user_id.to_s
    p "ConversationsController, update, here is isOwner" + isOwner.to_s

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
      else # else of first if
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
    end #end of each
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
    # p "!!!!!!params[:id]: " + params[:conversation_id].to_s
    @conversation = Conversation.find_by id: params[:id]
    unless @conversation.present?
      json_response "Cannot find conversation", false, {}, :not_found
    end
  end

  def conversation_params
    params.require(:conversation).permit(:flat_id)
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
