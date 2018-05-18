class Api::V1::BookingsController < ApplicationController
  # before_action :ensure_params_exist, only: :create
  before_action :valid_token, only: [:create, :create, :destroy]
  before_action :load_booking, only: [:show, :destroy]
  before_action :authenticate_with_token, only: [:show, :create, :destroy]

  def index
  end

  def show
    booking_serializer = parse_json @booking
    json_response "Showed booking successfully", true, {booking: booking_serializer}, :ok
  end

  def new
  end

  def create
    # called in requestBoooking in front end
    booking = Booking.new booking_params
    booking.user_id = @user.id
    booking.created_at = DateTime.now
    # only if have parent
    # booking.book_id = params[:book_id]
    if booking.save
      booking_serializer = parse_json booking

      json_response "Created booking succesfully", true, {booking: booking_serializer}, :ok
    else
      json_response "Create booking failed", false, {}, :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
    # booking delete request by flat owner
    if @booking.flat.user_id = current_user.id
      if @booking.destroy
        json_response "Deleted booking succesfully", true, {booking: @booking}, :ok
      else
        json_response "Delete booking failed", false, {}, :unprocessable_entity
      end
    else
      json_response "Delete booking failed", false, {}, :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flat_id, :date_start, :date_end)
  end

  def request_booking_params
    params.require(:booking).permit(:id)
  end

  def valid_token
    @user = User.find_by authentication_token: request.headers["AUTH-TOKEN"]
    if @user
      return @user
    else
      json_response "Invalid token", false, {}, :failure
    end
  end

  def load_booking
    @booking = Booking.find_by id: params[:id]
    unless @booking.present?
      json_response "Cannot find booking", false, {}, :not_found
    end
  end

end
