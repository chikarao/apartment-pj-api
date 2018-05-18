class Api::V1::Users::BookingsController < ApplicationController
  #
  #This is for Logined User
  before_action :valid_token, only: [:index]
  before_action :authenticate_with_token, only: [:index]

  def index
    # p 'in users, BookingsController'
    @bookings = Booking.where(user_id: @user.id).includes(:flat)
    # p @bookings
    if @bookings
      bookings_serializer = parse_json @bookings
      json_response "Indexed user's bookings successfully", true, {bookings: bookings_serializer}, :ok
    else
      json_response "Cannot find bookings for user", false, {}, :not_found
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
