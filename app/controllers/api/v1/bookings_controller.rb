require 'uri'
require 'net/http'
require 'json'
require 'Date'

class Api::V1::BookingsController < ApplicationController
  # before_action :ensure_params_exist, only: :create
  before_action :valid_token, only: [:create, :create, :destroy, :blockout_dates_ical]
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

  def blockout_dates_ical

    ical_link = 'https://calendar.google.com/calendar/ical/c0k45rf9b7kouldlg6k87o1ahc%40group.calendar.google.com/private-53f98142cd67b1641ea2aac051b4b1c8/basic.ics'
    flat_id = '190'

    url = URI.parse(ical_link)
    # url = URI.parse(  "https://connect.stripe.com/oauth/token/client_secret=#{secret_key}&code=#{authorization_code}&grant_type=#{grant_type}")
    response = Net::HTTP.get(url)

    if response
     range_array = []
      # p 'in booking_controller, blockout_dates_ical, response: ' + response.to_s
      # p 'in booking_controller, blockout_dates_ical, response.class: ' + response.class.to_s
      response_array = response.split("\n")
      dateStart = ''
      # p 'in booking_controller, blockout_dates_ical, response_array: ' + response_array.to_s
      response_array.each do |line, i|
        # p 'in booking_controller, blockout_dates_ical, line, i: ' + i.to_s + line.to_s
        if line.include? "DTSTART"
          dateStart1 = line.split(":")
          dateStart = dateStart1[1].split("\r")
          # p 'in booking_controller, blockout_dates_ical, date_start: ' + date_start.to_s
          # p 'in booking_controller, blockout_dates_ical, dateStart: ' + dateStart.to_s
          # range_object[date_start] = dateStart[1]
        end
        if line.include? "DTEND"
          dateEnd1 =line.split(":")
          dateEnd = dateEnd1[1].split("\r")
          # p 'in booking_controller, blockout_dates_ical, date_end: ' + date_end.to_s
          # p 'in booking_controller, blockout_dates_ical, dateEnd: ' + dateEnd.to_s
          # range_object[:date_end] = dateEnd[1]
          dS = Date.parse(dateStart[0], "%Y-%m-%d")
          dE = Date.parse(dateEnd[0], '%Y-%m-%d')

          # p 'in booking_controller, blockout_dates_ical, dS: ' + dS.to_s
          # p 'in booking_controller, blockout_dates_ical, dE: ' + dE.to_s
          # p 'in booking_controller, blockout_dates_ical, dS.year: ' + dS.year.to_s
          # p 'in booking_controller, blockout_dates_ical, dE.year: ' + dE.year.to_s
          # p 'in booking_controller, blockout_dates_ical, dS.month: ' + dS.month.to_s
          # p 'in booking_controller, blockout_dates_ical, dE.month: ' + dE.month.to_s
          # p 'in booking_controller, blockout_dates_ical, dS.day: ' + dS.day.to_s
          # p 'in booking_controller, blockout_dates_ical, dE.day: ' + dE.day.to_s
          # dateStartParsed = Date.parse(dateStart[0], "%Y-%m-%d")
          # dateEndParsed = Date.parse(dateEnd[0], '%Y-%m-%d')
          dateStartParsed = "#{dS.year}-#{dS.month}-#{dS.day}"
          dateEndParsed = "#{dE.year}-#{dE.month}-#{dE.day}"

          # range_object = {date_start: dateStart[0], date_end: dateEnd[0]}
          range_object = {date_start: dateStartParsed, date_end: dateEndParsed}
          range_array.push(range_object)
        end
      end
      #end of each do
      p 'in booking_controller, blockout_dates_ical, range_array: ' + range_array.to_s
    end
    #end of if response
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
