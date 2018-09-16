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
    flat = Flat.find_by(id: booking_params[:flat_id])
    # only if have parent
    # booking.book_id = params[:book_id]
    if booking.save
      booking_serializer = parse_json booking
      flat_serializer = parse_json flat

      json_response "Created booking succesfully", true, {booking: booking_serializer, flat: flat_serializer}, :ok
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
    dateToday = Date.today
    bookings_by_owner = Booking.where(booking_by_owner: true, booking_by_ical: true)
    p 'in booking_controller, blockout_dates_ical, bookings_by_owner: ' + bookings_by_owner.to_s

    flat_id = params[:flat_id]
    # flat_id = 190
    # need flat for creating booking
    @flat = Flat.find_by(id: flat_id)
    # ical_link = @flat.ical_import_url
    url_array = Calendar.where(flat_id: flat_id).pluck(:ical_url)
    # p 'in booking_controller, blockout_dates_ical, flat_id: ' + flat_id.to_s

    # Placeholder until set up icalendar model, controller and frontend
    response = ''
    # url_array = []
    # url_array.push(ical_link)
    # link2 = ""
    # url_array.push(link2)
    # when ical model set up, url_array = Calendar.where(flat_id = params[:flat_id])
    url_array.each do |each_url|
      p 'in booking_controller, blockout_dates_ical, each_url: ' + each_url.to_s
      url = URI.parse(each_url)
      res = Net::HTTP.get(url)
      if res
        response.concat(res)
      end
    end
        # url = URI.parse(ical_link)
        # response = Net::HTTP.get(url)

    # p 'in booking_controller, blockout_dates_ical, response: ' + response.to_s

    if response
      range_array = []

      response_array = response.split("\n")
      dateStart = ''
      booking_array =[]
      matching_range_array = []
      matching_range_id_array = []

      response_array.each do |line, i|
        # if response has line that includes DTSTART, the start of the blocking event
        if line.include? "DTSTART"
          dateStart1 = line.split(":")
          dateStart = dateStart1[1].split("\r")
        end

        # if response has line that includes DTEND, the end of the blocking event
        if line.include? "DTEND"
          dateEnd1 =line.split(":")
          dateEnd = dateEnd1[1].split("\r")

          dS = Date.parse(dateStart[0]).strftime("%Y-%m-%d")
          dE = Date.parse(dateEnd[0]).strftime("%Y-%m-%d")
          #format date to match Booking table starts and ends
          # object hash to block
          range_object = {date_start: Date.parse(dS), date_end: Date.parse(dE)}
          range_array.push(range_object)

          if bookings_by_owner.length > 0
            # get array of objects that match range_object
            matching_booking = bookings_by_owner.select { |booking_by_owner| (booking_by_owner.date_start == range_object[:date_start]) && (booking_by_owner.date_end == range_object[:date_end]) }
            # push matching bookings into array (do nothing with them)
            # incase of overlap, do each iterator

            if(matching_booking.length > 0)
              matching_range_array.push(matching_booking[0])
            end

            unless bookings_by_owner.any?{|booking_by_owner| (booking_by_owner.date_start == range_object[:date_start]) && (booking_by_owner.date_end == range_object[:date_end])}
              # p 'in booking_controller, blockout_dates_ical, creating booking in unless: '
              if range_object[:date_end] > dateToday
                create_blocking_booking(range_object, booking_array)
              end
            end
            #end of unless
          else
            # else bookings_by_owner.length > 0
            if range_object[:date_end] > dateToday
              create_blocking_booking(range_object, booking_array)
            end
          end
        #end if bookings_by_owner.length
          # mass assignment reference: https://stackoverflow.com/questions/19037733/why-does-my-rails-rollback-when-i-try-to-user-save
        end
        #end of if DTEND
      end
      #end of response_array each do
      #take out bookings from results that match the new ical date ranges
      # create new array of bookings that are not in the ical range to delete
      bookings_to_delete = bookings_by_owner.select {|b| !matching_range_array.include?(b)}
      # delete bookings by owner that are not matching with the events that are in the response ical
      bookings_to_delete.each do |each|
        each.destroy
      end

      flat_serializer = parse_json @flat
    end
    #end of if response
      json_response "Update bookings with ical succesfully", true, {flat: flat_serializer}, :ok
  end
  # end of blockout_dates_ical

  private

  def booking_params
    params.require(:booking).permit(:flat_id, :date_start, :date_end, :booking_by_owner)
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

  def create_blocking_booking(range_object, booking_array)
    booking = Booking.new
    booking.date_start = range_object[:date_start]
    booking.date_end = range_object[:date_end]
    booking.booking_by_owner = true
    booking.booking_by_ical = true
    booking.user_id = @user.id
    booking.flat_id = @flat.id
    # p 'in booking_controller, blockout_dates_ical, booking after new: ' + booking.date_start.to_s + " " + booking.date_end.to_s + " " + booking.booking_by_owner.to_s + " " + booking.user_id.to_s
    if booking.save
      booking_serializer = parse_json booking
      booking_array.push(booking_serializer)
    else
      json_response "Sync bookings failed", false, {}, :unprocessable_entity
    end
  end

end
