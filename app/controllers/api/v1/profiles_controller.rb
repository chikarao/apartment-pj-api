class Api::V1::ProfilesController < ApplicationController
  # before_action :load_conversation, only: [:index, :show, :destroy]
  before_action :load_profile, only: [:show, :update, :destroy]
  before_action :valid_token, only: [:show, :destroy, :update, :create]
  # before_action :load_profile_by_user_id, only: [:update]
  # before_action :load_user, only: [:create, :update]
  # before_action :does_profile_already_exist, only: [:create]

  def index
  end

  def show
    @profile = Profile.find_by id: params[:id]
    p "ProfilesController, show, @profile: " + @profile.to_s
    profile_serializer = parse_json @profile
    json_response "Showed profile successfully", true, {profile: profile_serializer}, :ok
  end

  def new
  end

  def create
    p "ProfilesController, create, here is profile params" + profile_params.to_s
    profile = Profile.new profile_params
    # profile.flat_id = profile_params[:flat_id]
    profile.user_id = @user.id
    profile.image = "blank_profile_picture_4"
    # profile.created_at = DateTime.now
    # only if have parent
    # profile.book_id = params[:book_id]
    if profile.save
      user_serializer = parse_json @user
      profile_serializer = parse_json profile
      json_response "Created profile succesfully", true, {profile: profile_serializer, user: user_serializer}, :ok
    else
      json_response "Create profile failed", false, {}, :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @profile.update profile_params
      user_serializer = parse_json @user
      profile_serializer = parse_json @profile
      json_response "Updated profile succesfully", true, {profile: profile_serializer, user: user_serializer }, :ok
    else
      json_response "Update profile failed", false, {}, :unprocessable_entity
    end
  end

  def destroy
    if @profile.destroy
      user_serializer = parse_json @user
    json_response "Deleted profile succesfully", true, {profile: @profile, user: user_serializer}, :ok
    end
  end

  private

  def load_profile_by_user_id
    # front end gets params and sends it in fetchFlatFromParams
    @profile = Profile.find_by user_id: @user.id
    unless @profile.present?
      json_response "Cannot find profile", false, {}, :not_found
    end
  end

  def load_user
    # front end gets params and sends it in fetchFlatFromParams
    @user = User.find_by id: profile_params[:user_id]
    unless @user.present?
      json_response "Cannot find user", false, {}, :not_found
    end
  end

  def profile_params
    params.require(:profile).permit(
      :user_id,
      :image,
      :identification,
      :title,
      :name,
      :first_name,
      :middle_name,
      :last_name,
      :username,
      :address1,
      :address2,
      :city,
      :state,
      :zip,
      :region,
      :country,
      :language,
      :birthday,
      :phone,
      :gender,
      :emergency_contact_name,
      :emergency_contact_phone,
      :emergency_contact_address,
      :emergency_contact_relationship,
      :introduction,
      :language_code
    )
  end

  def load_profile
    # front end gets params and sends it in fetchFlatFromParams
    @profile = Profile.find_by id: params[:id]
    unless @profile.present?
      json_response "Cannot find flat", false, {}, :not_found
    end
  end

  def valid_token
    @user = User.find_by authentication_token: request.headers["AUTH-TOKEN"]
    p "ProfilesController, valid_token, @user: " + @user.to_s
    if @user
      return @user
    else
      json_response "Invalid token", false, {}, :failure
    end
  end

  # def does_profile_already_exist
  #   profile = Profile.find_by user_id: profile_params[:user_id]
  #   p "profile controller profile_already_exists" + profile.to_s
  #   if profile
  #     json_response "A profile for that user already exists.", false, {}, :bad_request
  #     return
  #   end
  # end
end
