module Authenticate
  def current_user
    auth_token = request.headers["AUTH-TOKEN"]
    return unless auth_token
    @current_user = User.find_by authentication_token: auth_token
  end

  def authenticate_with_token
    p "******* in Authenticate authentication_token run"
    return if current_user
    json_response "Unauthorized request", false, {}, :unauthorized
  end

  def correct_user user
    user.id == current_user.id
  end
end
