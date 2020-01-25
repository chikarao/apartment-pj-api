# UserStatus in concerns/user_status for creating and upding redis hash
include UserStatus

class Api::V1::SessionsController < Devise::SessionsController
  before_action :sign_in_params, only: :create
  before_action :set_get_online_offline_params, only: :set_get_online_offline
  before_action :load_user, only: :create
  # before_action :valid_token, only: :destroy
  before_action :valid_token, only: [:log_out, :set_get_online_offline]
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
        set_last_user_activity({user_id: @user.id, logged_in: true, online: false})
        json_response "Signed in successfully", true, {user: @user}, :ok
     else
       # redirect_to 'localhost:8080/'
       json_response "Please activate your account by following the instructions in the account confirmation email you received to proceed", false, {}, :unauthorized
     end
    else
      json_response "Unauthorized. Please check your password.", false, {}, :unauthorized
    end
  end

  def set_get_online_offline
    result = false
    user_status_hash = nil
    p "***************** in set_get_online_offline, set_get_online_offline_params: " + set_get_online_offline_params.to_s
    # p "***************** in set_get_online_offline, set_get_online_offline_params[:user_id]: " + set_get_online_offline_params[:user_id].to_s
    # p "***************** in set_get_online_offline, set_get_online_offline_params[:online]: " + set_get_online_offline_params[:online].to_s
    online = set_get_online_offline_params[:online].to_i == 1 ? true : false
    # params will have 'set' or get as action; if set, then set the hash in redis
    # result return true or false depding on redis response of OK or not
    if set_get_online_offline_params[:action] == 'set'
      result = set_last_user_activity({user_id: @user.id, logged_in: true, online: online, keep_online_status: false})
    end
    # if action in params is 'get'
    if result || set_get_online_offline_params[:action] = 'get'
      if $redis
        user_status_hash = get_user_status_by_user_id(@user.id)
        if !user_status_hash
          user_status_hash = set_last_user_activity({user_id: @user.id, logged_in: true, online: online, keep_online_status: false})
        end
        if set_get_online_offline_params[:action] = 'set'
          send_notification_to_other_users(@user.id)
        end
      end
      # p "***************** in set_get_online_offline, in result OK: "
      json_response "Set/got user key successfully", true, {user_status: user_status_hash}, :ok
    else
      # p "***************** in set_get_online_offline, in result NOT OK, result: " + result.to_s
      json_response "Set/got user key Unsuccessful", false, {}, :failure
    end
  end

  def log_out
  # def destroy
    set_last_user_activity({user_id: @user.id, logged_in: false, online: false})
    sign_out @user
    #sign_out comes from devise/lib/devise/controllers/sign_in_out.rb
    @user.generate_new_authentication_token
    json_response "Logged out successfully", true, {}, :ok
  end

  private

  def sign_in_params
    params.require(:sign_in).permit(:email, :password)
  end

  def set_get_online_offline_params
    params.require(:set_get_online_offline).permit(:user_id, :online, :action)
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
