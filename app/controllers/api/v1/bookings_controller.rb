require 'uri'
require 'net/http'
require 'json'
require 'Date'
require 'prawn'
# require 'RMagick'
# require 'open-uri'

class Api::V1::BookingsController < ApplicationController
  # before_action :ensure_params_exist, only: :create
  before_action :valid_token, only: [:create, :create, :destroy, :blockout_dates_ical, :create_contract]
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

  def create_contract
    flat = Flat.find_by(id: 190)
    p 'in booking_controller, create_contract, flat.id: ' + flat.id.to_s
    # CombinePDF is for combine_pdf gem
    pdf_base = CombinePDF.load(Rails.root.join("app/assets/pdf/teishaku_jp.pdf"))
    # ipaex_gothic_path = Rails.root.join("app/assets/fonts/osaka.ttc")
    # path for external font ttf
    ipaex_gothic_path = Rails.root.join("app/assets/fonts/ipaexg.ttf")

    pdf = Prawn::Document.new
    hor = 140
    ver = 660

    pdf.font_families["IPAEX_GOTHIC"] = {
                        :bold        => ipaex_gothic_path,
                        :italic      => ipaex_gothic_path,
                        :bold_italic => ipaex_gothic_path,
                        :normal      => ipaex_gothic_path
                      }
    # pdf.font_families.update(
    #   "Osaka" => {
    #                     :bold        => ipaex_gothic_path,
    #                     :italic      => ipaex_gothic_path,
    #                     :bold_italic => ipaex_gothic_path,
    #                     :normal      => ipaex_gothic_path
    #                   })
      p 'in booking_controller, create_contract, pdf.font_families: ' + pdf.font_families.to_s

      pdf.font("IPAEX_GOTHIC") do
        pdf.draw_text "ほうれん荘", :at => [hor, ver], :size => 10
        # pdf.draw_text "Chateau Margeaux Mansion2", :at => [hor, ver], :size => 10
      end

    # pdf.draw_text "Here is the flat: #{flat.id}, #{flat.description} at 100, 100", :at => [100, 100], :size => 10
    # pdf.draw_text "Here is the flat: #{flat.id}, #{flat.description} at 200, 200, size 20", :at => [200, 200], :size => 20
    # pdf.draw_text "Here is the flat: #{flat.id}, #{flat.description} at 300, 300, size 30", :at => [300, 300], :size => 30
    # pdf.draw_text "Here is the flat: #{flat.id}, #{flat.description} at 400, 400, size 40", :at => [400, 400], :size => 40
    # pdf.draw_text "Here is the flat: #{flat.id}, #{flat.description} at 100, 500, size 10", :at => [100, 500], :size => 10
    # pdf.draw_text "Here is the flat: #{flat.id}, #{flat.description} at 100, 600, size 10, bold italic", :at => [100, 600], :size => 10, :style => :bold, :style => :italic
    # pdf.draw_text "Here is the flat: #{flat.id}, #{flat.description} at 100, 700, size 10", :at => [100, 700], :size => 10
    # pdf.draw_text "Here is the flat: #{flat.id}, #{flat.description} at 100, 800, size 10", :at => [100, 800], :size => 10
    # pdf.draw_text "Here is the flat: #{flat.id}, #{flat.description} at 50, 750, size 5", :at => [50, 750], :size => 5
    # pdf.draw_text "Here is the flat: #{flat.id}, #{flat.description} at 150, 650, size 7", :at => [150, 650], :size => 7
    # pdf.text "Hello World! Here is the flat: #{flat.id}, #{flat.description}"
    pdf.stroke_axis()
    pdf.stroke_circle [325, 495], 10
    pdf.stroke_circle [286.1, 483], 6.6
    pdf.stroke_circle [307, 470], 6.6
    pdf.stroke_circle [307, 457], 6.6
    pdf.stroke_circle [286.1, 444], 6.6
    pdf.stroke_circle [286.1, 431], 6.6
    pdf.stroke_circle [286.1, 418], 6.6
    pdf.stroke_circle [307, 405], 6.6
    pdf.stroke_circle [307, 392], 6.6
    pdf.stroke_circle [307, 379], 6.6

    # pdf.stroke_ellipse [200, 100], 100, 50
    # Rounded rectable ver hor, width height radius
    pdf.stroke do
       pdf.rounded_rectangle [132, 615], 60, 15, 5
    end
    # pdf.bounding_box([100, 500], :width => 300, :height => 200, :color => '0000FF') do
      # pdf.stroke_color "0000ff"
      # pdf.line_width = 1
      # pdf.dash([3], :phase => 1)
      # pdf.stroke_bounds
      # pdf.stroke_color "ff0000"
      # pdf.stroke_circle [0, 0], 20
    # end
    # pdf.start_new_page
    # pdf.draw_text "Here is the flat: #{flat.id}, #{flat.description} at 150, 650, size 7 on a new page", :at => [150, 650], :size => 7
    #
    # pdf.start_new_page
    # pdf.draw_text "Here is the flat: #{flat.id}, #{flat.description} at 150, 650, size 7 on a new page", :at => [150, 650], :size => 7

    path_merge = Rails.root.join("public/system/temp_files/pdf_files/pdf_merge.pdf")
    pdf.render_file(path_merge)

    # p 'in booking_controller, create_contract, p  df: ' + pdf.to_s
    # p 'in booking_controller, create_contract, result: ' + result.to_s
    # p 'in booking_controller, create_contract, result: ' + result["public_id"].to_s
    # # File.delete(Rails.root + '/foo.jpg')
    # keep
    # File.delete("public/system/temp_files/pdf_files/example.pdf")
    pdf_merge = CombinePDF.load(Rails.root.join("public/system/temp_files/pdf_files/pdf_merge.pdf"))
    # pdf_combined = CombinePDF.new
    # pdf_combined << pdf_merge
    # pdf_combined << pdf_base
    # pdf_base.pages.each {|page| page << pdf_merge}
    # pdf_base.pages.each_with_index {|page, i| page << pdf_mesrge.pages[i]}
    # .pages is an array of pages
    pdf_base.pages[0]<< pdf_merge.pages[0]
    # pdf_base.pages[1]<< pdf_merge.pages[1]
    # pdf_base << pdf_merge
    pdf_base.save(Rails.root.join("public/system/temp_files/pdf_files/pdf_combined.pdf"))
    # keep
    # path = Rails.root.join("public/system/temp_files/pdf_files", pdf)
    path_combined = Rails.root.join("public/system/temp_files/pdf_files/pdf_combined.pdf")
    # keep
    # file = File.open(path_combined)

    # keep
    result = Cloudinary::Uploader.upload(Rails.root.join("public/system/temp_files/pdf_files/pdf_combined.pdf"))
    # result = Cloudinary::Uploader.upload(Rails.root.join("public/system/temp_files/pdf_files/pdf_combined.pdf"), :width => 792, :height => 1122, "format" => 'jpg')
    p 'in booking_controller, create_contract, result: ' + result.to_s
    File.delete(path_merge)

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
        flats = Flat.where(user_id: @booking.user_id)
        flat_serializer = parse_json flats
        json_response "Deleted booking succesfully", true, {flats: flat_serializer }, :ok
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
