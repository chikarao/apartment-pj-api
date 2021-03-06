class Api::V1::UsersController < ApplicationController
    before_action :valid_token, only: [:update]

  def confirm_email
    @user = User.find_by_confirm_token(params[:confirm_token])
    if @user
      @user.email_activate
      json_response "Email confirmed successfully", true, {user: @user}, :ok
      # redirect_to "localhost:8080/feature"
      return
    else
      json_response "There is something wrong with the confirmation request", false, {}, :unprocessable_entity
      # redirect_to "localhost:8080/"
      return
    end
  end

  def update
    # destroy image in cloudinary only if profile picture is not currently the designated blank profile picture
    # !!!!! DO NOT delete blank_profile_picture_4 (may be updated) from cloudinary as it used for any profiles without a picture uploaded by the user
    # if params image is not the blank pic and user image is not blank destroy pic
    # SO the case of removing own pic for another own pic
    # MAKE SURE TO CHANGE blank_profile_picture_4 in registrations controller
    result_upload = nil
    # Set upload succefull flat true at beginning; if result is not received, turn false, so able to handle no image file uplaod
    upload_successful = true
    path = nil
    if !params[:file].blank?
      uploaded_io = params[:file]
      uploaded_flat_id = params[:flatId]
      path = Rails.root.join("public/system/temp_files/images", uploaded_io.original_filename)
      # file_array = []
      # open file for writing in binary
      File.open(path, 'wb') do |file|
        file.write(uploaded_io.read)
      end

      image = File.open(path)
      result_upload = Cloudinary::Uploader.upload(image, options = {})
      upload_successful = false if !result_upload
      # if the new image is not a blank, remove image from cloudinary
      if @user.image != "blank_profile_picture_4"
        result = Cloudinary::Uploader.destroy(@user.image)
        # p "in if user_params[:image], does not equals blank_profile_picture_4: " + user_params[:image].to_s
      end
    end

    # if params image IS the blank pic and current user image is not the blank picture
    # SO the case of removing own pic for blank pic
    if user_params[:image] == "blank_profile_picture_4"
      # if the new image is not a blank, remove image from cloudinary
      if @user.image != "blank_profile_picture_4"
        result = Cloudinary::Uploader.destroy(@user.image)
        # p "in second if, does not equals blank_profile_picture_4: " + user_params[:image].to_s
      end
    end
    # set params for updating user record
    # image value becomes result public_id if result is returned successfully
    update_params = {image: result_upload["public_id"]} if result_upload
    # If there is no result upload for any reason, image valu is what user sends or blank
    update_params = {image: user_params[:image] || "blank_profile_picture_4"} if !result_upload

    if upload_successful && @user.update(update_params)
      user_serializer = parse_json @user
      json_response "Updated user image succesfully", true, {user: user_serializer}, :ok
      File.delete(path) if path
    else
      json_response "Update user image failed", false, {}, :unprocessable_entity
      File.delete(path) if path
    end
  end

  def facebook
    if params[:facebook_access_token]
      digest = OpenSSL::Digest.new('sha1')
      key = ENV["FB_SECRET"]
      data = params[:facebook_access_token]
      hmac = OpenSSL::HMAC.hexdigest(digest, key, data)
      # hmac = OpenSSL::HMAC.hexdigest("SHA256", key, data)
      # hmac = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), key, data)
      # graph = Koala::Facebook::API.new(params[:facebook_access_token], hmac)
      graph = Koala::Facebook::API.new(params[:facebook_access_token])
      # p "graph" + graph.to_s
      user_data = graph.get_object("me?fields=name, email, id, picture")
      # p "user_data" + user_data.to_s
      user = User.find_by email: user_data["email"]

      if user
        user.generate_new_authentication_token
        existing_user = true
        json_response "Logged in through Facebook successfully -- User information", true, {user: user, existing_user: existing_user}, :ok
      else
        user = User.new(email: user_data["email"],
                        uid: user_data["id"],
                        provider: "facebook",
                        # image: user_data["picture"]["data"]["url"],
                        image: 'blank_profile_picture_4',
                        email_confirmed: true,
                        password: Devise.friendly_token[0,20])

        user.authentication_token = User.generate_unique_secure_token
        # user[:existing_user] = false

        if user.save
          profile = Profile.new
          profile.user_id = user.id
          if profile.save
          # UserNotifier.send_signup_email(user).deliver
          # UserNotifier.send_registration_confirmation_email(user).deliver
            user_serializer = parse_json user
            json_response "Created new user and logged in through Facebook successfully", true, {user: user, existing_user: existing_user}, :ok
          end
        else
          json_response user.errors, false, {}, :unprocessable_entity
        end
      end
    else
      json_response "Missing Facebook access token", false, {}, :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:image)
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
