class Api::V1::RegistrationsController < Devise::RegistrationsController
  # before_action(:ensure_params_exist, only: :create)
  before_action :ensure_params_exist, only: :create
  before_action :does_user_already_exist, only: :create
  #sign up
  def create
    user = User.new(user_params)
    user.image = "blank_profile_picture_4"
    # p "here is user" + user.to_s
    if user.save
      profile = Profile.new
      profile.user_id = user.id
      if profile.save
      # UserNotifier.send_signup_email(user).deliver
      UserNotifier.send_registration_confirmation_email(user).deliver
      user_serializer = parse_json user
      json_response "Thank you! You've signed up successfully! Please confirm your registration in the email link we just sent you.", true, {user: user_serializer}, :ok
      end
    else
      json_response "Unable to sign up.", false, {}, :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
  # In Postman use user[email] and user[password] or sign-up request will be
  # missing information
  def ensure_params_exist
    return if params[:user].present?
    json_response "Missing information in request.", false, {}, :bad_request
    #same code above just refactored the below code
    #json_response defined in app/controlers/concerns/response.rb and included in application_controller.rb
    # render json: {
    #   message: "Missing information",
    #   is_success: false,
    #   data: {}
    # }, status: :bad_request
  end

  def does_user_already_exist
    user = User.find_by email: user_params[:email].downcase
    p "registration controller user_already_exists" + user.to_s
    if user && user.provider != "facebook"
      json_response "That user has already signed up. Please sign in.", false, {}, :bad_request
    end

    if user.provider == "facebook"
      json_response "That user has already signed up through #{user.provider}. Please sign in.", false, {}, :bad_request
    end

  end
    #same code above just refactored the below code
    #json_response defined in app/controlers/concerns/response.rb and included in application_controller.rb
    # render json: {
    #   message: "Missing information",
    #   is_success: false,
    #   data: {}
    # }, status: :bad_request
end
