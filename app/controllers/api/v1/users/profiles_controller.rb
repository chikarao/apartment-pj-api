class Api::V1::Users::ProfilesController < ApplicationController
  #
  #This is for Logined User
  before_action :valid_token, only: [:profile_for_user]
  before_action :authenticate_with_token, only: [:profile_for_user]

  def index

  end

  def profile_for_user
    p 'in users, ProfilesController, profile_by_user: '
    @profile = Profile.find_by user_id: @user.id
    # p @like
    if @profile
      profile_serializer = parse_json @profile
      json_response "Fetched profile for user successfully", true, {profile: profile_serializer}, :ok
    else
      json_response "Cannot find profile for user", false, {}, :not_found
    end
  end

  private

  def valid_token
    @user = User.find_by authentication_token: request.headers["AUTH-TOKEN"]
    if @user
      return @user
    else
      json_response "Invalid token", false, {}, :failure
    end
  end
end
