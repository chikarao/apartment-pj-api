require 'uri'
require 'net/http'
require 'json'
require 'Date'
require 'prawn'
# require 'RMagick'
# require 'open-uri'

class Api::V1::BookingsController < ApplicationController
  # before_action :ensure_params_exist, only: :create
  before_action :valid_token, only: [:show, :create, :destroy, :blockout_dates_ical, :create_contract]
  before_action :load_booking, only: [:show, :destroy]
  before_action :authenticate_with_token, only: [:show, :create, :destroy]

  def index
  end

  def show
    booking_serializer = parse_json @booking
    # p "bookings controller, show @user.first_name: " + @user.first_name.to_s
    user_serializer = parse_json @user
    json_response "Showed booking successfully", true, {booking: booking_serializer, user: user_serializer}, :ok
  end

  def new
  end

  def create_contract
    flat = Flat.find_by(params[:flat_id])
    flat_id = params[:flat_id]
    contract_name = params[:contract_name]

    # CombinePDF is for combine_pdf gem
    pdf_base = CombinePDF.load(Rails.root.join("app/assets/pdf/#{contract_name}.pdf"))
    # path for external font ttf

    # Letter size 612 x 792
    # pdf = Prawn::Document.new(:margin => [0, 0, 0, 0], :page_size => [612, 792])
    pdf = Prawn::Document.new(:margin => [0, 0, 0, 0], :page_size => [595, 841])
    # pdf = Prawn::Document.new(:margin => [0, 0, 0, 0], :page_size => "A4")

    # A4 dimensions in inches
    hor_total_inches = 8.27
    ver_total_inches = 11.69
    points_per_inch = 72

    # !!!!!!adjustment for margin on frontend and padding of input fields
    # same horizontal x adjument for input and circle
    adjustment_x = 0.01
    # accounts for top 0, left: 0 at upper left; points 0, 0 in PDF is left bottom
    # vertical y adjustment for circle
    adjustment_y = 0.015
    # !!!!!!adjustment for margin on frontend and padding of input fields
    # Use slightly different adjustment for inputs
    adjustment_input_y = 0.013
    # bigger y farther down; bigger x farther right
    additional_adjustment_circle_x = 0.01
    additional_adjustment_circle_y = 0.025

    ipaex_gothic_path = Rails.root.join("app/assets/fonts/ipaexg.ttf")
    # define custom font in assets/fonts/ipaexg
    pdf.font_families["IPAEX_GOTHIC"] = {
                        :bold        => ipaex_gothic_path,
                        :italic      => ipaex_gothic_path,
                        :bold_italic => ipaex_gothic_path,
                        :normal      => ipaex_gothic_path
                      }
    # get array of pages in params
    document_pages_array = []
    params.each do |each|
      if (!(document_pages_array.include? params[each]["page"].to_i) && params[each]["page"] )
        document_pages_array.push(params[each]["page"].to_i)
      end
    end
    # p 'in booking_controller, create_contract, params[eachField], document_pages_array: ' + document_pages_array.to_s

    # for each page in params, go through params onces
    # if input field, rectangle, circle, draw each
    document_pages_array.length.times do |i|
      params.each do |eachField|
        # p 'in booking_controller, create_contract, params[eachField],  params[eachField]["page"], i: ' + params[eachField].to_s + " " + params[eachField]["page"].to_s + " " + i.to_s
        # p 'in booking_controller, create_contract, params[eachField]: ' + params[eachField].to_s
        # p 'in booking_controller, create_contract, params[eachField]["name"] eachField["type"] == "string" (eachField["val"] == "inputFieldValue"): ' + params[eachField]["name"].to_s + " " +  (params[eachField]["type"] == "string").to_s + " " + (params[eachField]["val"] == "inputFieldValue").to_s
        # p 'in booking_controller, create_contract, params[eachField]["name"] params[eachField]["type"] params[eachField]["val"]: ' + params[eachField]["name"].to_s + " " +  params[eachField]["type"].to_s + " " + params[eachField]["val"].to_s
        # draw input fields
        if params[eachField]["type"] == "string" && params[eachField]["val"] == "inputFieldValue" && params[eachField]["page"].to_i == (i + 1)
          x = params[eachField]["left"].to_f / 100 + adjustment_x
          y = params[eachField]["top"].to_f / 100 + adjustment_input_y
          hor_points = hor_total_inches * x * points_per_inch
          ver_points = ver_total_inches * (1 - y) * points_per_inch
          # draw_input(hor_points, ver_points, params[eachField["value"]], pdf, ipaex_gothic_path)
          pdf.font("IPAEX_GOTHIC") do
            # pdf.draw_text params[:name][:value], :at => [hor_points, ver_points], :size => 10
            # pdf.draw_text params[:name][:value], :at => [hor_points, ver_points], :size => 10
            # pdf.draw_text params[:address][:value], :at => [address_hor_points, address_ver_points], :size => 10
            pdf.draw_text params[eachField]["value"], :at => [hor_points, ver_points], :size => 10
            # pdf.draw_text "RC", :at => [construction_type_input_hor_points, construction_type_input_ver_points], :size => 10
            # pdf.draw_text "まかろに町", :at => [0, 0], :size => 10
            # pdf.draw_text "Chateau Margeaux Mansion2", :at => [hor, ver], :size => 10
          end
        end
        # end of string inputfield
        # draw rectagles
        if params[eachField]["type"] == "button" && params[eachField]["className"] == "document-rectangle" && params[eachField]["page"].to_i == (i + 1)
          rectangle_x =  params[eachField]["left"].to_f / 100 + adjustment_x / 3;
          rectangle_y =  params[eachField]["top"].to_f / 100;
          rectangle_hor_points = hor_total_inches * rectangle_x * points_per_inch
          rectangle_ver_points = ver_total_inches * (1 - rectangle_y) * points_per_inch
          rectagle_width_points = hor_total_inches * params[eachField]["width"].to_f / 100 * points_per_inch
          pdf.stroke do
             # pdf.rounded_rectangle [132, 615], 60, 15, 5
             pdf.rounded_rectangle [rectangle_hor_points, rectangle_ver_points], rectagle_width_points, 12, 5
             # pdf.rounded_rectangle [construction_type_hor_points, construction_type_ver_points], 50, 12, 5
          end
        end
        if params[eachField]["type"] == "button" && params[eachField]["className"] == "document-circle" && params[eachField]["page"].to_i == (i + 1)
          circle_x = params[eachField]["left"].to_f / 100 + adjustment_x + additional_adjustment_circle_x
          circle_y = (1 - params[eachField]["top"].to_f / 100) + adjustment_y - additional_adjustment_circle_y
          circle_hor_points = hor_total_inches * circle_x * points_per_inch
          circle_ver_points = ver_total_inches * circle_y * points_per_inch
          pdf.stroke_circle [circle_hor_points, circle_ver_points], 6
        end
      end
      pdf.start_new_page
    end

    pdf.stroke_axis()

    path_merge = Rails.root.join("public/system/temp_files/pdf_files/pdf_merge.pdf")
    pdf.render_file(path_merge)

    # keep
    # File.delete("public/system/temp_files/pdf_files/example.pdf")
    pdf_merge = CombinePDF.load(Rails.root.join("public/system/temp_files/pdf_files/pdf_merge.pdf"))
    # pdf_combined = CombinePDF.new
    # pdf_combined << pdf_merge
    # pdf_combined << pdf_base
    # pdf_base.pages.each {|page| page << pdf_merge}
    # pdf_base.pages.each_with_index {|page, i| page << pdf_mesrge.pages[i]}
    # .pages is an array of pages
    document_pages_array.each_with_index do |eachPage, i|
      pdf_base.pages[i]<< pdf_merge.pages[i]
    end
    # pdf_base.pages[1]<< pdf_merge.pages[1]
    # pdf_base << pdf_merge
    pdf_base.save(Rails.root.join("public/system/temp_files/pdf_files/pdf_combined.pdf"))
    # keep
    # path = Rails.root.join("public/system/temp_files/pdf_files", pdf)
    path_combined = Rails.root.join("public/system/temp_files/pdf_files/pdf_combined.pdf")
    # keep
    # file = File.open(path_combined)
    # p "SENDGRID_USERNAME: #{ENV['SENDGRID_USERNAME']}"
    # p "SENDGRID_PASSWORD: #{ENV['SENDGRID_PASSWORD']}"
    # Send PDF as attachment!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    # UserNotifier.send_contract_email(path_combined, user).deliver
    # keep
    # result = Cloudinary::Uploader.upload(Rails.root.join("public/system/temp_files/pdf_files/pdf_combined.pdf"))
    # result = Cloudinary::Uploader.upload(Rails.root.join("public/system/temp_files/pdf_files/pdf_combined.pdf"), :width => 792, :height => 1122, "format" => 'jpg')
    # p 'in booking_controller, create_contract, result: ' + result.to_s
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
