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
    flat = Flat.find_by(id: 190)
    flat_id = params[:flat_id]
    p 'in booking_controller, create_contract, flat.id: ' + flat.id.to_s
    p 'in booking_controller, create_contract, params flat_id: ' + flat_id.to_s
    p 'in booking_controller, create_contract, params params[:address].top: ' + params[:address][:top].to_s
    p 'in booking_controller, create_contract, params[:flat_building_name][:top].to_s: ' + params[:flat_building_name][:top].to_f.to_s
    # CombinePDF is for combine_pdf gem
    pdf_base = CombinePDF.load(Rails.root.join("app/assets/pdf/teishaku-saimuhosho.pdf"))
    # ipaex_gothic_path = Rails.root.join("app/assets/fonts/osaka.ttc")
    # path for external font ttf
    ipaex_gothic_path = Rails.root.join("app/assets/fonts/ipaexg.ttf")

    # Letter size 612 x 792
    # pdf = Prawn::Document.new(:margin => [0, 0, 0, 0], :page_size => [612, 792])
    pdf = Prawn::Document.new(:margin => [0, 0, 0, 0], :page_size => [595, 841])
    # pdf = Prawn::Document.new(:margin => [0, 0, 0, 0], :page_size => "A4")
    # hor = 140
    # ver = 660
    # A4 dimensions in inches
    hor_total_inches = 8.27
    ver_total_inches = 11.69
    points_per_inch = 72

    # adjustment_x = 0.107
    # adjustment_y = -0.07
    # adjustment_x = (0.03) / 0.245
    # adjustment_y = (0.015) / 0.16
    # adjustment_x = (0.03 + 0.245) / 0.245
    # adjustment_y = (0.015 + 0.16) / 0.16
    # !!!!!!adjustment for margin on frontend and padding of input fields
    # same horizontal x adjument for input and circle
    adjustment_x = 0.02
    # accounts for top 0, left: 0 at upper left; points 0, 0 in PDF is left bottom
    # vertical y adjustment for circle
    adjustment_y = 0.01
    # !!!!!!adjustment for margin on frontend and padding of input fields
    # Use slightly different adjustment for inputs
    adjustment_input_y = 0.015
    # bigger y farther down; bigger x farther right
    # 1 px = 0.75 points
    # 0, 0 is at center of circle, and bottom left of a text box, so need to offset radius and height of text
    # building_name_x = 0.245 + adjustment_x
    building_name_x = params[:flat_building_name][:left].to_f / 100 + adjustment_x
    building_name_y = params[:flat_building_name][:top].to_f / 100 + adjustment_input_y
    p 'in booking_controller, create_contract, building_name_x.to_s: ' + building_name_x.to_s
    # building_name_x = 0.245 + adjustment_x
    # building_name_y = 0.16 + adjustment_input_y
    # building_name_x = 0.245 + adjustment_x
    # building_name_y = 0.16 + adjustment_y
    address_x = params[:address][:left].to_f / 100 + adjustment_x
    address_y = params[:address][:top].to_f / 100 + adjustment_input_y
    # address_x = 0.245 + adjustment_x
    # address_y = 0.186 + adjustment_input_y
    address_x_unadjusted = 0.245
    address_y_unadjusted = 0.185
    circle_x = 0.4725 + adjustment_x
    circle_y = 0.377 + adjustment_y
    building_type_x =  params[:building_type][:left].to_f / 100 + adjustment_x / 3;
    building_type_y =  params[:building_type][:top].to_f / 100;
    # building_type_x = 0.27 + adjustment_x / 3;
    # building_type_y = 0.243;
    construction_type_x = 0.45 + adjustment_x / 3;
    construction_type_y = 0.216;
    construction_type_input_x = 0.545 + adjustment_x;
    construction_type_input_y = 0.24 + adjustment_y;
    # building_type_x = 0.27;
    # building_type_y = 0.228;
    # circle size 6 that is tangent to x and y axis lower left
    # circle1_x = 0.10390946502057613 + adjustment_x
    # circle1_x = 0.08641975308641975 + adjustment_x
    circle1_x = 0.10732323232323232
    circle1_y = 0.12834224598930483
    # circle1_x = 0.08641975308641975
    # circle1_y = 0.1265597147950089
    # circle1_x = 0.01
    # circle1_y = 0.9925
    # circle1_x = 0
    # circle1_y = 0.3725
    # circle_x1 = 0.473 + 0.02
    # circle_y1 = 0.375 + 0.01
    # circle_x = 0.473
    # circle_y = 0.375
    # circle_x = 0.473 + 0.02
    # circle_y = 0.375 + 0.01
    hor_points = hor_total_inches * building_name_x * points_per_inch
    ver_points = ver_total_inches * (1 - building_name_y) * points_per_inch
    address_hor_points = hor_total_inches * address_x * points_per_inch
    address_ver_points = ver_total_inches * (1 - address_y) * points_per_inch
    circle_hor_points = hor_total_inches * circle_x * points_per_inch
    circle_ver_points = ver_total_inches * (1 - circle_y) * points_per_inch
    # address_hor_points_unadjusted = hor_total_inches * address_x_unadjusted * points_per_inch
    # address_ver_points_unadjusted = ver_total_inches * (1 - address_y_unadjusted) * points_per_inch
    building_type_hor_points = hor_total_inches * building_type_x * points_per_inch
    building_type_ver_points = ver_total_inches * (1 - building_type_y) * points_per_inch

    construction_type_hor_points = hor_total_inches * construction_type_x * points_per_inch
    construction_type_ver_points = ver_total_inches * (1 - construction_type_y) * points_per_inch

    construction_type_input_hor_points = hor_total_inches * construction_type_input_x * points_per_inch
    construction_type_input_ver_points = ver_total_inches * (1 - construction_type_input_y) * points_per_inch

    circle1_hor_points = hor_total_inches * circle1_x * points_per_inch
    circle1_ver_points = ver_total_inches * (1 - circle1_y) * points_per_inch

    p "hor_total_inches: " + hor_total_inches.to_s
    p "ver_total_inches: " + ver_total_inches.to_s
    p "building_name_x: " + building_name_x.to_s
    p "building_name_x: " + building_name_y.to_s
    p "points_per_inch: " + points_per_inch.to_s
    p "hor_points: " + hor_points.to_s
    p "ver_points: " + hor_points.to_s
    p "circle_hor_points: " + circle_hor_points.to_s
    p "circle_ver_points: " + circle_ver_points.to_s
    p "circle_hor_points out 50: " + sprintf("%0.50f", circle_hor_points)
    p "circle_ver_points out 50: " + sprintf("%0.50f", circle_ver_points)
    p "adjustment_y 0.015 in points, hor_total_inches * adjustment_y * points_per_inch " + (hor_total_inches * adjustment_y * points_per_inch).to_s
    p "adjustment_x 0.02 in points, ver_total_inches * adjustment_x * points_per_inch " + (ver_total_inches * adjustment_x * points_per_inch).to_s


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
        # pdf.draw_text params[:flat_building_name][:value], :at => [hor_points, ver_points], :size => 10
        pdf.draw_text params[:flat_building_name][:value], :at => [hor_points, ver_points], :size => 10
        pdf.draw_text params[:address][:value], :at => [address_hor_points, address_ver_points], :size => 10
        # pdf.draw_text "RC", :at => [construction_type_input_hor_points, construction_type_input_ver_points], :size => 10
        # pdf.draw_text "まかろに町", :at => [0, 0], :size => 10
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
    # pdf.stroke_circle [circle1_hor_points, circle1_ver_points], 6
    pdf.stroke_circle [circle_hor_points, circle_ver_points], 6
    # pdf.stroke_circle [circle_hor_points, circle_ver_points - 13], 6
    # pdf.stroke_circle [circle_hor_points, circle_ver_points - 26], 6
    # pdf.stroke_circle [circle_hor_points, circle_ver_points - 39], 6
    # pdf.stroke_circle [circle_hor_points, circle_ver_points - 52], 6
    # pdf.stroke_circle [circle_hor_points, circle_ver_points - 65], 6
    # pdf.stroke_circle [circle_hor_points, circle_ver_points - 78], 6
    # pdf.stroke_circle [circle_hor_points, circle_ver_points - 91], 6
    # pdf.stroke_circle [circle_hor_points, circle_ver_points - 104], 6
    # pdf.stroke_circle [circle_hor_points, circle_ver_points - 117], 6
    # pdf.stroke_circle [circle_hor_points, circle_ver_points - 130], 6
    # pdf.stroke_circle [circle_hor_points, circle_ver_points - 143], 6
    # pdf.stroke_circle [circle_hor_points, circle_ver_points - 155], 6
    # pdf.stroke_circle [circle_hor_points, circle_ver_points - 168], 6
    # pdf.stroke_circle [325, 495], 10
    # pdf.stroke_circle [286.1, 483], 6.6
    # pdf.stroke_circle [307, 470], 6.6
    # pdf.stroke_circle [307, 457], 6.6
    # pdf.stroke_circle [286.1, 444], 6.6
    # pdf.stroke_circle [286.1, 431], 6.6
    # pdf.stroke_circle [286.1, 418], 6.6
    # pdf.stroke_circle [307, 405], 6.6
    # pdf.stroke_circle [307, 392], 6.6
    # pdf.stroke_circle [307, 379], 6.6

    # pdf.stroke_ellipse [200, 100], 100, 50
    # Rounded rectable ver hor, width height radius
    pdf.stroke do
       # pdf.rounded_rectangle [132, 615], 60, 15, 5
       pdf.rounded_rectangle [building_type_hor_points, building_type_ver_points], 60, 12, 5
       pdf.rounded_rectangle [construction_type_hor_points, construction_type_ver_points], 50, 12, 5
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
