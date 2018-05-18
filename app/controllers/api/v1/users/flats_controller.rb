class Api::V1::Users::FlatsController < ApplicationController
  #
  #This is for Logined User
  before_action :valid_token, only: [:index]
  before_action :authenticate_with_token, only: [:index]

  def index
    p 'in users, FlatsController'
    @flats = Flat.where(user_id: @user.id).includes(:bookings, :images)
    p @flats
    if @flats
      flats_serializer = parse_json @flats
      json_response "Indexed user's flats successfully", true, {flats: flats_serializer}, :ok
    else
      json_response "Cannot find flat for user", false, {}, :not_found
    end
    # @flat = Flat.order(created_at: :desc)
    # @flat = policy_scope(Flat).order(created_at: :desc)

     # authorize @cars
  end

  # def show
  #   @car = Car.find(params[:id])
  #
  #   @hash = Gmaps4rails.build_markers(@car) do |car, marker|
  #     marker.lat car.latitude
  #     marker.lng car.longitude
  #     # marker.infowindow render_to_string(partial: "/cars/map_box", locals: { car: car })
  #   end
  # end
  #
  #
  #
  # def create
  # end
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
