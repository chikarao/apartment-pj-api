# UserStatus in concerns/user_status for creating and upding redis hash
include UserStatus

class Api::V1::SessionsController < Devise::SessionsController
  before_action :sign_in_params, only: :create
  before_action :load_user, only: :create
  # before_action :valid_token, only: :destroy
  before_action :valid_token, only: :log_out
  skip_before_action :verify_signed_out_user, only: :log_out
  # skip_before_action :verify_signed_out_user, only: :destroy
  # comes from devise/app/controllers/devise/sessions_controller
  # verify_signed_out_user called in prepend_before_action
  def create
    # p 'in sesssions controller, create' + sign_in_params.to_s
    if @user.valid_password?(sign_in_params[:password])
      # sign_in "user", @user
      # json_response "Signed in successfully", true, {user: @user}, :ok
      if @user.email_confirmed
        sign_in "user", @user
        set_last_user_activity({user_id: @user.id, logged_in: true, online: true})
        json_response "Signed in successfully", true, {user: @user}, :ok
     else
       # redirect_to 'localhost:8080/'
       json_response "Please activate your account by following the instructions in the account confirmation email you received to proceed", false, {}, :unauthorized
     end
    else
      json_response "Unauthorized. Please check your password.", false, {}, :unauthorized
    end
  end

  def log_out
  # def destroy
    set_last_user_activity({user_id: @user.id, logged_in: false, online: false})
    sign_out @user
    # p "***************** in Sessions#log_out @user.id: " + @user.id.to_s
    #sign_out comes from devise/lib/devise/controllers/sign_in_out.rb
    @user.generate_new_authentication_token
    json_response "Logged out successfully", true, {}, :ok
  end

  private

  def sign_in_params
    params.require(:sign_in).permit(:email, :password)
  end

  # check if user exists
  def load_user
    @user = User.find_for_database_authentication(email: sign_in_params[:email])
    # check if user sign up through facebook; if not return @user for
    if @user && @user.provider != "facebook"
      return @user
    elsif !@user
      json_response "An account with that email does not exist. Please check email address or sign up.", false, {}, :unauthorized
    else
      # if user signed up through facebook, send error message to sigin in
      if @user.provider == "facebook"
        json_response "User has signed up through #{@user.provider}. Please sign sign in using the Facebook button",  false, {}, :failure
      else
        json_response "Cannot find user",  false, {}, :failure
      end
    end
  end

  def valid_token
    @user = User.find_by authentication_token: request.headers["AUTH-TOKEN"]
    if @user
      return @user
    else
      # p "***************** in Sessions#destroy in if else @user: "
      json_response "Invalid token", false, {}, :failure
    end
  end
end
