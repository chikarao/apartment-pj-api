class Api::V1::SessionsController < Devise::SessionsController
  before_action :sign_in_params, only: :create
  before_action :load_user, only: :create
  before_action :valid_token, only: :destroy
  skip_before_action :verify_signed_out_user, only: :destroy
  # comes from devise/app/controllers/devise/sessions_controller
  # verify_signed_out_user called in prepend_before_action
  def create
    # p 'in sesssions controller, create' + sign_in_params.to_s
    if @user.valid_password?(sign_in_params[:password])
      # sign_in "user", @user
      # json_response "Signed in successfully", true, {user: @user}, :ok
      if @user.email_confirmed
        sign_in "user", @user
        json_response "Signed in successfully", true, {user: @user}, :ok
     else
       # redirect_to 'localhost:8080/'
       json_response "Please activate your account by following the instructions in the account confirmation email you received to proceed", false, {}, :unauthorized
     end
    else
      json_response "Unauthorized", false, {}, :unauthorized
    end
  end

  def destroy
    sign_out @user
    #sign_out comes from devise/lib/devise/controllers/sign_in_out.rb
    @user.generate_new_authentication_token
    json_response "Logged out successfully", true, {}, :ok
  end

  private
  def sign_in_params
    params.require(:sign_in).permit(:email, :password)
  end

  def load_user
    @user = User.find_for_database_authentication(email: sign_in_params[:email])
    if @user
      return @user
    else
      json_response "Cannot find user",  false, {}, :failure
    end
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
