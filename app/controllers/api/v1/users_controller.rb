class Api::V1::UsersController < ApplicationController
    before_action :valid_token, only: [:update]
#   def create
#     # Create the user from params
#     @user = User.new(params[:user])
#     if @user.save
#       # Deliver the signup email
#       UserNotifier.send_signup_email(@user).deliver
#       # redirect_to(@user, :notice => 'User created')
#       json_response "Logged in to Facebook successfully", true, {user: user}, :ok
#     else
#       # render :action => 'new'
#       json_response "Unable to send signup email", false, {}, :unprocessable_entity
#     end
#   end
# end
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
    result = Cloudinary::Uploader.destroy(@user.image)
    if @user.update user_params
      user_serializer = parse_json @user
      json_response "Updated user succesfully", true, {user: user_serializer, image_delete_result: result}, :ok
    else
      json_response "Update user image failed", false, {}, :unprocessable_entity
    end
  end

  def facebook
    if params[:facebook_access_token]
      graph = Koala::Facebook::API.new params[:facebook_access_token]
      user_data = graph.get_object("me?fields=name, email, id, picture")

      user = User.find_by email: user_data["email"]
      if user
        user.generate_new_authentication_token
        json_response "User information", true, {user: user}, :ok
      else
        user = User.new(email: user_data["email"],
                        uid: user_data["id"],
                        provider: "facebook",
                        image: user_data["picture"]["data"]["url"],
                        password: Devise.friendly_token[0,20])

        user.authentication_token = User.generate_unique_secure_token
        if user.save
          json_response "Logged in to Facebook successfully", true, {user: user}, :ok
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
