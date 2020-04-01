require 'uri'
require 'net/http'
require 'json'
require 'Date'
require 'prawn'
# require CreatePdf
# import DocumentTranslations
# require 'RMagick'
# require 'open-uri'

class Api::V1::BookingsController < ApplicationController
  include DocumentTranslationImportantPoints
  include DocumentTranslationFixedTerm
  include CreatePdf
  # before_action :ensure_params_exist, only: :create
  before_action :valid_token, only: [:show, :create, :destroy, :blockout_dates_ical, :create_contract]
  before_action :load_booking, only: [:show, :update, :destroy]
  before_action :authenticate_with_token, only: [:show, :create, :destroy]
  before_action :bookings_for_dates_exist, only: [:create]

  # def index
  # end

  def show
    # p "!!! in bookings#show: "
    booking_serializer = parse_json @booking
    contracts = @booking.contracts
    agreements = @booking.agreements
    # assignments = contracts[0].assignments
    # assignments = []
    work_type_object = {}
    staffTranslationObject = {}
    contractorTranslationObject = {}
    unless contracts.empty?
      contracts.each do |eachContract|
        contractArray = []
        # unless work_type_object[eachContract.work_type]
        # p "!!!! eachContract.Assignments each: " + eachContract.assignments.to_s
        contractor_serializer = parse_json eachContract.contractor
        # get array of all contractor's languages
        contractorTranslationObject[eachContract.contractor.id] = [contractor_serializer]
        contractorTranslation = Contractor.where(base_record_id: eachContract.contractor.id)
        # p "!!!!!!!!!!!!!!!!!!!!contractorTranslation.count" + contractorTranslation.count.to_s
        unless contractorTranslation.empty?
          contractorTranslation.each do |each|
            # push all contractor with base_record_id of the contractred controactor into array in object
            contractor_serializer = parse_json each
            contractorTranslationObject[eachContract.contractor.id].push(contractor_serializer)
          end
        end
          eachContract.assignments.each do |eachAssignment|
            # p "!!!! eachAssignment each id: " + eachAssignment.id.to_s
            # p "!!!! eachAssignment: " + eachAssignment.to_s
            assignment_serializer = parse_json eachAssignment
            contractArray.push(assignment_serializer)
            # get array of all staff's languages
            staff_serializer = parse_json eachAssignment.staff
            staffTranslationObject[eachAssignment.staff.id] = [staff_serializer]
            # .where creates array of arrays for staffTranslationObject
            staffTranslation = Staff.where(base_record_id: eachAssignment.staff.id)
            # p "!!!!!!!!!!!!!!!staffTranslation.count" + staffTranslation.count.to_s
            unless staffTranslation.empty?
              # push all staff with base_record_id of the assigned staff into array in object
              staffTranslation.each do |each|
                staff_serializer = parse_json each
                staffTranslationObject[eachAssignment.staff.id].push(staff_serializer)
              end
            end
          end
          work_type_object[eachContract.work_type] = contractArray
        # end
      end
    end

    document_inserts_array = []
    agreements.each do |each_agreement|
      document_inserts = DocumentInsert.where(agreement_id: each_agreement.id)
      if !document_inserts.empty?
        document_inserts.each do |each_insert|
          document_inserts_serializer = parse_json each_insert
          document_inserts_array.push(document_inserts_serializer)
        end
      end
    end

    # agreements_serializer = parse_json agreements, include: 'document_field.document_field_choices'
    # @project.to_json( include: { estimates: {
    #                 include: {:project, :project_code, :tax_type, :proposals } } }
    # serialized_agreement = agreement.to_json(include: { document_field_choices })
    agreements_serializer = parse_json agreements

    flat = Flat.find_by(id: @booking.flat_id)
    # owner = User.find_by(id: flat.user_id)
    # assignment_serializer = parse_json assignments
    contract_serializer = parse_json contracts
    flat_serializer = parse_json flat
    # p "bookings controller, show @user.first_name: " + @user.first_name.to_s
    user_serializer = parse_json @user
    # owner_serializer = parse_json owner
    json_response "Showed booking successfully", true, {booking: booking_serializer, user: user_serializer, flat: flat_serializer, contracts: contract_serializer, assignments: work_type_object, contractorTranslations: contractorTranslationObject, staffTranslations: staffTranslationObject, agreements: agreements_serializer, document_inserts_all: document_inserts_array}, :ok
  end

  def new
  end

  def create_contract
    flat = Flat.find_by(id: params[:flat_id].to_i)
    flat_id = params[:flat_id]
    save_and_create = params[:save_and_create]
    document_language_code = params[:document_language_code]
    # p "!!!!!! params[:document_field]: " + params[:document_field].to_s
    # p "!!!!!! document_field_params[:document_field]: " + and document_field_params[:document_field].to_s
    # contract_name = params[:contract_name]
    contract_name = params[:template_file_name]
    # calling module in concerns/document_translation and getting object...
    contract_translation_map_object = { 'teishaku-saimuhosho': DocumentTranslationFixedTerm::OBJECT, "juyoujikou-setsumei-jp": DocumentTranslationImportantPoints::OBJECT }
    # gets translation objects from concerns/document_translation_fixed_term.rb
    translation = contract_translation_map_object[contract_name]
    # gets translation objects from concerns/document_translation_important_points.rb
    # important_points = important_points_explanation_translation
    # call module in create_pdf in concerns/create_pdf
    create_pdf(params[:document_field], contract_name, save_and_create, translation, document_language_code)

    # # CombinePDF is for combine_pdf gem
    # pdf_base = CombinePDF.load(Rails.root.join("app/assets/pdf/#{contract_name}.pdf"))
    # # path for external font ttf
    #
    # # Letter size 612 x 792
    # # pdf = Prawn::Document.new(:margin => [0, 0, 0, 0], :page_size => [612, 792])
    # pdf = Prawn::Document.new(:margin => [0, 0, 0, 0], :page_size => [595, 841])
    # # pdf = Prawn::Document.new(:margin => [0, 0, 0, 0], :page_size => "A4")
    #
    # # A4 dimensions in inches
    # hor_total_inches = 8.27
    # ver_total_inches = 11.69
    # points_per_inch = 72
    #
    # # !!!!!!adjustment for margin on frontend and padding of input fields
    # # same horizontal x adjument for input and circle
    # adjustment_x = 0.01
    # # accounts for top 0, left: 0 at upper left; points 0, 0 in PDF is left bottom
    # # vertical y adjustment for circle
    # adjustment_y = 0.015
    # # !!!!!!adjustment for margin on frontend and padding of input fields
    # # Use slightly different adjustment for inputs
    # adjustment_input_y = 0.013
    # # bigger y farther down; bigger x farther right
    # additional_adjustment_circle_x = 0.01
    # additional_adjustment_circle_y = 0.025
    #
    # ipaex_gothic_path = Rails.root.join("app/assets/fonts/ipaexg.ttf")
    # # define custom font in assets/fonts/ipaexg
    # pdf.font_families["IPAEX_GOTHIC"] = {
    #                     :bold        => ipaex_gothic_path,
    #                     :italic      => ipaex_gothic_path,
    #                     :bold_italic => ipaex_gothic_path,
    #                     :normal      => ipaex_gothic_path
    #                   }
    # # get array of pages in params
    # document_pages_array = []
    # # Push page number in array if not already in array.
    # params[:document_field].each do |each|
    # # document_field_params[:document_field].each do |each|
    #   if (!(document_pages_array.include? each["page"].to_i) && each["page"].to_i )
    #     document_pages_array.push(each["page"].to_i)
    #   end
    #   # p "!!!!!! document_pages_array: " + document_pages_array.to_s
    # end
    # # p 'in booking_controller, create_contract, eachField, document_pages_array: ' + document_pages_array.to_s
    #
    # #!!!!!! START RENDER OF PDF
    # # for each page in params, go through params onces
    # # if input field, rectangle, circle, draw each
    # document_pages_max = document_pages_array.max
    # page = 1
    # (document_pages_max).times do
    #   # p "!!!!!!!!!!!!!!!!!!!!!!document_pages_max, document_pages_array.include?(page), document_pages_array, page" +" " + document_pages_max.to_s + " "+ document_pages_array.include?(page).to_s + " " + document_pages_array.to_s + " " + (page).to_s
    #   if document_pages_array.include?(page)
    #     params[:document_field].each do |eachField|
    #       # p "!!!!!!!!!!!!!!!!!!!!!! Writing page" + page.to_s
    #     # p "!!!!!! params[:document_field].each, eachField: " + eachField.to_s
    #     # p 'in booking_controller, create_contract, eachField,  eachField["page"], i: ' + params[eachField].to_s + " " + params[eachField]["page"].to_s + " " + i.to_s
    #     # p 'in booking_controller, create_contract, params[eachField]: ' + params[eachField].to_s
    #     # p 'in booking_controller, create_contract, params[eachField]["name"] eachField["input_type"] == "string" (eachField["val"] == "inputFieldValue"): ' + params[eachField]["name"].to_s + " " +  (params[eachField]["input_type"] == "string").to_s + " " + (params[eachField]["val"] == "inputFieldValue").to_s
    #     # p 'in booking_controller, create_contract, params[eachField]["name"] params[eachField]["input_type"] params[eachField]["val"]: ' + params[eachField]["name"].to_s + " " +  params[eachField]["input_type"].to_s + " " + params[eachField]["val"].to_s
    #     # draw input fields
    #
    #     # p "!!!!!!!!!!!!!!!!!!!!!! Writing page" + page.to_s + " Inside if input_type == string..."
    #       if (eachField["input_type"] == "string" || eachField["input_type"] =="text" || eachField["input_type"] =="date") && eachField["val"] == "inputFieldValue" && eachField["page"].to_i == (page)
    #         x = eachField["left"].to_f / 100 + adjustment_x
    #         y = eachField["top"].to_f / 100 + adjustment_input_y
    #         hor_points = hor_total_inches * x * points_per_inch
    #         ver_points = ver_total_inches * (1 - y) * points_per_inch
    #         text_to_display = eachField["display_text"] ? eachField["display_text"] : eachField["value"]
    #         # draw_input(hor_points, ver_points, params[eachField["value"]], pdf, ipaex_gothic_path)
    #         pdf.font("IPAEX_GOTHIC") do
    #           # pdf.draw_text params[:name][:value], :at => [hor_points, ver_points], :size => 10
    #           # pdf.draw_text params[:name][:value], :at => [hor_points, ver_points], :size => 10
    #           # pdf.draw_text params[:address][:value], :at => [address_hor_points, address_ver_points], :size => 10
    #           pdf.draw_text text_to_display, :at => [hor_points, ver_points], :size => 10
    #           # pdf.draw_text "RC", :at => [construction_type_input_hor_points, construction_type_input_ver_points], :size => 10
    #           # pdf.draw_text "まかろに町", :at => [0, 0], :size => 10
    #           # pdf.draw_text "Chateau Margeaux Mansion2", :at => [hor, ver], :size => 10
    #         end
    #       end
    #       # end of string inputfield
    #       # draw rectagles
    #       # if eachField["input_type"] == "button" && eachField["class_name"] == "document-rectangle" && eachField["page"].to_i == (page)
    #       if (eachField["input_type"] == "button") && (eachField["class_name"] == "document-rectangle")  && !(eachField["enclosed_text"]) && (eachField["page"].to_i == (page))
    #         rectangle_x =  eachField["left"].to_f / 100 + adjustment_x / 3;
    #         rectangle_y =  eachField["top"].to_f / 100;
    #         rectangle_hor_points = hor_total_inches * rectangle_x * points_per_inch
    #         rectangle_ver_points = ver_total_inches * (1 - rectangle_y) * points_per_inch
    #         rectagle_width_points = hor_total_inches * eachField["width"].to_f / 100 * points_per_inch
    #         pdf.stroke do
    #            # pdf.rounded_rectangle [132, 615], 60, 15, 5
    #            pdf.rounded_rectangle [rectangle_hor_points, rectangle_ver_points], rectagle_width_points, 12, 5
    #            # pdf.rounded_rectangle [construction_type_hor_points, construction_type_ver_points], 50, 12, 5
    #         end
    #       end
    #       # !!!!! enclosed_text Button!!!!
    #       if (eachField["input_type"] == "button") && (eachField["class_name"] == "document-rectangle") && eachField["enclosed_text"] && (eachField["page"].to_i == (page))
    #         # p "!!!!!! params[:document_field].each, eachField[enclosed_text]: " + eachField["enclosed_text"].to_s
    #         # rectangle_x =  eachField["left"].to_f / 100 + adjustment_x / 3;
    #         # rectangle_y =  eachField["top"].to_f / 100;
    #         # rectangle_hor_points = hor_total_inches * rectangle_x * points_per_inch
    #         # rectangle_ver_points = ver_total_inches * (1 - rectangle_y) * points_per_inch
    #         # rectagle_width_points = hor_total_inches * eachField["width"].to_f / 100 * points_per_inch
    #         x = eachField["left"].to_f / 100 + adjustment_x
    #         y = eachField["top"].to_f / 100 + adjustment_input_y
    #         hor_points = hor_total_inches * x * points_per_inch
    #         ver_points = ver_total_inches * (1 - y) * points_per_inch
    #         # text_to_display = eachField["display_text"] ? eachField["display_text"] : eachField["value"]
    #
    #         # pdf.stroke do
    #         #    # pdf.rounded_rectangle [132, 615], 60, 15, 5
    #         #    pdf.rounded_rectangle [rectangle_hor_points, rectangle_ver_points], rectagle_width_points, 12, 5
    #         #    # pdf.rounded_rectangle [construction_type_hor_points, construction_type_ver_points], 50, 12, 5
    #         # end
    #         pdf.font("IPAEX_GOTHIC") do
    #           pdf.draw_text eachField["enclosed_text"], :at => [hor_points, ver_points], :size => 10
    #         end
    #       end
    #
    #       if (eachField["input_type"] == "button") && (eachField["class_name"] == "document-circle") && !(eachField["enclosed_text"]) && eachField["page"].to_i == (page)
    #         circle_x = eachField["left"].to_f / 100 + adjustment_x + additional_adjustment_circle_x
    #         circle_y = (1 - eachField["top"].to_f / 100) + adjustment_y - additional_adjustment_circle_y
    #         circle_hor_points = hor_total_inches * circle_x * points_per_inch
    #         circle_ver_points = ver_total_inches * circle_y * points_per_inch
    #         pdf.stroke_circle [circle_hor_points, circle_ver_points], 6
    #       end
    #     end
    #   else
    #     p "Writing skipped page" + page.to_s
    #     pdf.font("IPAEX_GOTHIC") do
    #       pdf.draw_text "Skippped", :at => [100, 100], :size => 100
    #     end
    #   end
    #   pdf.start_new_page
    #   page += 1
    # end
    #
    # pdf.stroke_axis()
    #
    # path_merge = Rails.root.join("public/system/temp_files/pdf_files/pdf_merge.pdf")
    # pdf.render_file(path_merge)
    #
    # # keep
    # # File.delete("public/system/temp_files/pdf_files/example.pdf")
    # pdf_merge = CombinePDF.load(Rails.root.join("public/system/temp_files/pdf_files/pdf_merge.pdf"))
    # # pdf_combined = CombinePDF.new
    # # pdf_combined << pdf_merge
    # # pdf_combined << pdf_base
    # # pdf_base.pages.each {|page| page << pdf_merge}
    # # pdf_base.pages.each_with_index {|page, i| page << pdf_mesrge.pages[i]}
    # # .pages is an array of pages
    # # p "!!!! Before PDF Merge document_pages_array: " + document_pages_array.to_s
    # # document_pages_array.each_with_index do |eachPage, i|
    # document_pages_array.each_with_index do |eachPage, i|
    #   # p "!!!! PDF Merge each_with_index: " + eachPage.to_s
    #   # pdf_base.pages[i]<< pdf_merge.pages[i]
    #   pdf_base.pages[(eachPage - 1)]<< pdf_merge.pages[(eachPage - 1)]
    # end
    # # pdf_base.pages[1]<< pdf_merge.pages[1]
    # # pdf_base << pdf_merge
    # pdf_base.save(Rails.root.join("public/system/temp_files/pdf_files/pdf_combined.pdf"))
    # # keep
    # # path = Rails.root.join("public/system/temp_files/pdf_files", pdf)
    # path_combined = Rails.root.join("public/system/temp_files/pdf_files/pdf_combined.pdf")
    # # keep
    # # file = File.open(path_combined)
    # # p "SENDGRID_USERNAME: #{ENV['SENDGRID_USERNAME']}"
    # # p "SENDGRID_PASSWORD: #{ENV['SENDGRID_PASSWORD']}"
    # # Send PDF as attachment!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    # # UserNotifier.send_contract_email(path_combined, user).deliver
    # # keep
    # # result = Cloudinary::Uploader.upload(Rails.root.join("public/system/temp_files/pdf_files/pdf_combined.pdf"))
    # # result = Cloudinary::Uploader.upload(Rails.root.join("public/system/temp_files/pdf_files/pdf_combined.pdf"), :width => 792, :height => 1122, "format" => 'jpg')
    # # p 'in booking_controller, create_contract, result: ' + result.to_s
    # File.delete(path_merge)
  end

  def create
    # called in requestBoooking in front end
    booking = Booking.new booking_params
    profile = Profile.find_by(user_id: @user.id)
    booking.user_id = @user.id
    booking.created_at = DateTime.now
    flat = Flat.find_by(id: booking_params[:flat_id])
    facilities_array = params[:facilities]
    tenants_array =  params[:tenants]
    booking.final_rent = flat.price_per_month
    booking.final_deposit = flat.deposit
    # booking.final_key_money = flat.key_money
    # parking included
    # final key money

    # only if have parent
    # booking.book_id = params[:book_id]
    # p "!!!!!!params[:profile]:" + params[:profile].to_s
    if booking.save && (profile_params ? profile.update(profile_params) : true)

      facilities_array.each do |eachFacility|
        # p "!!!eachFacility: " + eachFacility.to_s
        facility_attributes = {booking_id: booking.id, facility_deposit: eachFacility[:facility_deposit], facility_number: eachFacility[:facility_number], facility_type: eachFacility[:facility_type], price_per_month: eachFacility[:price_per_month], optional: eachFacility[:optional]}
        facility = Facility.new(facility_attributes)
        # facility.booking_id = booking.id
        unless facility.save
          booking.destroy
          json_response "Create booking failed", false, {}, :unprocessable_entity
        end
      end

      tenants_array.each do |eachTenant|
        tenant_attributes = {user_id: @user.id, booking_id: booking.id, name: eachTenant[:name], age: eachTenant[:age]}
        tenant = Tenant.new(tenant_attributes)
        tenant.user_id = @user.id
        # tenant.booking_id = booking.id
        unless tenant.save
          booking.destroy
          json_response "Create booking failed", false, {}, :unprocessable_entity
        end
      end

      booking_serializer = parse_json booking
      flat_serializer = parse_json flat

      json_response "Created booking succesfully", true, {booking: booking_serializer, flat: flat_serializer}, :ok
    else
      json_response "Create booking failed", false, {}, :unprocessable_entity
    end
  end

  def edit
  end

  def fetch_translation
    # gets translation objects from concerns/document_translation_fixed_term.rb
    fixed_term = DocumentTranslationFixedTerm::OBJECT
    # fixed_term = fixed_term_rental_contract_translation
    # gets translation objects from concerns/document_translation_important_points.rb
    important_points = DocumentTranslationImportantPoints::OBJECT
    # important_points = important_points_explanation_translation

    translation = { fixed_term_rental_contract_bilingual: fixed_term, important_points_explanation_bilingual: important_points }

    unless !translation
      json_response "Fetched traslation succesfully", true, {translation: translation.to_json}, :ok
    else
      json_response "Fetched traslation failed", false, {}, :unprocessable_entity
    end
  end

  def update
    if @booking.update(booking_params)

      def get_deposit_amount
        p "!!!!! get_deposit_amount, @booking.final_rent, @booking.final_deposit: " + @booking.final_rent.to_s + " " + @booking.final_deposit.to_s
        return (@booking.final_rent * @booking.final_deposit)
      end
      # Reference: https://stackoverflow.com/questions/27645773/store-functions-in-hash
      booking_documents_fields = {
        "final_rent" => {field_name: "final_rent"},
        "final_deposit" => {field_name: "final_deposit"},
        "deposit_amount" => {field_name: "deposit_amount", method_hash: method(:get_deposit_amount) }
      }

      agreements = Agreement.where(booking_id: @booking.id)
      booking_documents_fields.keys.each do |each_field_key|
        agreements.each do |each_agreement|
          field = DocumentField.find_by(agreement_id: each_agreement.id, name: booking_documents_fields[each_field_key][:field_name])
          p "!!!!! each_field_key, field: " + each_field_key.to_s + " " + field.to_s
          unless !field
            field_value = booking_params[each_field_key]
            if booking_documents_fields[each_field_key][:method_hash]
              field_value = booking_documents_fields[each_field_key][:method_hash].()
              p "!!!!! update in if booking..., field_value: " + field_value.to_s
            end
            field.value = field_value
            field.save
          end
        end
      end
      booking_serializer = parse_json @booking
      json_response "Created booking succesfully", true, {booking: booking_serializer}, :ok
    else
      json_response "Create booking failed", false, {}, :unprocessable_entity
    end
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
    # p 'in booking_controller, blockout_dates_ical, bookings_by_owner: ' + bookings_by_owner.to_s

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
      # p 'in booking_controller, blockout_dates_ical, each_url: ' + each_url.to_s
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

  def email_documents
    # p "!!!!email documents params message: " + params[:message].to_s
    # p "!!!!email documents params documents_array: " + params[:documents_array].to_s
    message_to_recipient = params[:message]
    email_subject =  params[:subject]
    cc_array = params[:cc_array]
    bcc_array = params[:bcc_array]
    tenant_user_id = params[:user_id]
    booking_id = params[:booking_id]
    # p "!!!!email documents params cc_array: " + cc_array.to_s
    # p "!!!!email documents params bcc_array: " + bcc_array.to_s
    # p "!!!!email documents params email_subject: " + email_subject.to_s
    # p "!!!!email documents params tenant_user_id: " + tenant_user_id.to_s
    # p "!!!!email documents params booking_id: " + booking_id.to_s
    user_tenant = User.find_by(id: tenant_user_id)
    # WHEN ready, assign landlord email, @user.email, to user_email
    user_email = 'c.okada@tothetable.co.jp'
    # WHEN ready, assign booking.user_id email to tenant_user_email
    tenant_user_email = 'chikara_okada@yahoo.co.jp'
    documents_array =  params[:documents_array]
    pdf_path_array = []
    pdf_path_file_object = {}
    agreements_array = []
    unless documents_array.empty?
      documents_array.each_with_index do |each_id, i|
        agreement = Agreement.find_by(id: each_id)
        agreement_pdf_download = Cloudinary::Downloader.download(agreement.document_publicid, :flags => :attachment)
        # p "pdf_insert_download: " + pdf_insert_download.to_s
        # Define path to insert pdf
        path_agreement_pdf = Rails.root.join("public/system/temp_files/pdf_files/#{agreement.document_name}_#{i}.pdf")
        # convert encoding from Cloudinary's ASCII-8BIT encoding to UTF-8 encoding
        # p "download " + download.to_s
        # p "download encoding " + download.encoding.to_s
        # download.force_encoding('utf-8')
        # p "download encoding after encoding " + download.encoding.to_s

        # Create new File instance for writing in binary
        # agreement_pdf_download.force_encoding('utf-8')
        agreement_pdf = File.new(path_agreement_pdf, "wb")
        # agreement_pdf = File.new(path_agreement_pdf, "wb")
        agreement_pdf.write(agreement_pdf_download)
        agreement_pdf.close
        pdf_path_array.push(path_agreement_pdf)
        pdf_path_file_object[agreement.document_name] = path_agreement_pdf
        agreements_array.push(agreement)
      end
      #end of documents_array each
    end
    # end of unless documents_array.empty?
    # p "!!!!pdf_path_file_object: " + pdf_path_file_object.to_s

    # path = Rails.root.join("public/system/temp_files/pdf_files/pdf_combined.pdf")
    # Call send_contract_email in UserNotifier in app/mailers/user_notifier.rb
    sent = UserNotifier.send_contract_email(pdf_path_file_object, @user, user_email, tenant_user_email, email_subject, cc_array, bcc_array, message_to_recipient).deliver
    # sent = UserNotifier.send_contract_email(path, @user).deliver

    if sent
      pdf_path_file_object.keys.each do |eachKey|
        File.delete(pdf_path_file_object[eachKey])
        # p "!!! each deleted" + eachKey.to_s
      end
      agreement_save_count = 0
      agreements_array.each do |eachAgreement|
        eachAgreement.sent_to_tenant = true
        unless eachAgreement.save
          agreement_save_count += 1
        end
      end
      if agreement_save_count == 0
        booking = Booking.find_by(id: booking_id)
        booking_serializer = parse_json booking
        json_response "Emailed documents succesfully", true, {booking: booking_serializer}, :ok
      else
        json_response "Send email failed", false, {}, :unprocessable_entity
      end
    else
      pdf_path_file_object.keys.each do |eachKey|
        File.delete(pdf_path_file_object[eachKey])
        # p "!!! each deleted" + eachKey.to_s
      end
      json_response "Send email failed", false, {}, :unprocessable_entity
    end

  end

  def mark_documents_signed
    documents_array = params[:documents_array]
    booking_id = params[:booking_id]
    booking = Booking.find_by(id: booking_id)
    mark_as_signed = params[:mark_as_signed]

    if documents_array.length <= booking.agreements.length
      agreement_save_count = 0
      documents_array.each do |each_document_id|
        agreement = Agreement.find_by(id: each_document_id)
        agreement.tenant_signed = mark_as_signed
        unless agreement.save
          agreement_save_count += 1
        end
      end
      # end of each
      if agreement_save_count == 0
        booking = Booking.find_by(id: booking_id)
        booking_serializer = parse_json booking
        json_response "Marked documents signed succesfully", true, {booking: booking_serializer}, :ok
      else
        json_response "Mark documents signed failed", false, {}, :unprocessable_entity
      end
    end
    #end of documents_array <=
  end

  private

  def booking_params
    params.require(:booking).permit(:flat_id,
      :date_start,
      :date_end,
      :booking_by_owner,
      :final_rent,
      :adjustments,
      :fees,
      :taxes,
      :total_price,
      :final_deposit,
      # :final_key_money,
      # :parking_included,
      :paid,
      :approved)
  end

  # def facility_params
  #   params.require(:facility).permit(:flat_id, :booking_id, :optional, :facility_type, :price_per_month, :discount, :facility_number, :facility_deposit, :facility_key_money, :facility_management_fees, :facility_format, :facility_broker_fees, :facility_name, :on_building_grounds)
  # end

  def profile_params
    params.require(:profile).permit(:user_id,
      :image,
      :identification,
      :title,
      :name,
      :first_name,
      :middle_name,
      :last_name,
      :username,
      :address1,
      :address2,
      :city,
      :state,
      :zip,
      :region,
      :country,
      :language,
      :birthday,
      :phone,
      :gender,
      :emergency_contact_name,
      :emergency_contact_phone,
      :emergency_contact_address,
      :emergency_contact_relationship,
      :introduction)
  end

  # def document_field_params
  #   params.permit(document_field: [
  #     :id,
  #     :name,
  #     :agreement_id,
  #     :input_type,
  #     :text_align,
  #     :page,
  #     :val,
  #     :value,
  #     :enclosed_text,
  #     :top,
  #     :left,
  #     :width,
  #     :height,
  #     :font_size,
  #     :margin,
  #     :class_name,
  #     :class_name_1,
  #     :component_type,
  #     :component_name,
  #     :display_text,
  #     ]
  #   )
  # end

  # def request_booking_params
  #   params.require(:booking).permit(:id)
  # end

  # def booking_params
  #   params.require(:booking).permit(:id, :approved)
  # end

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

  def bookings_for_dates_exist
    # check if booking exists within range of dates
    # should not catch any since front end rejects any calendar input spanning any bookings
    # called in before action only create
    booking_base_conditions = ''
    booking_params_array = [booking_base_conditions]
    if booking_params[:date_start] && booking_params[:date_end]
      startDate = Date.parse(booking_params[:date_start])
      endDate = Date.parse(booking_params[:date_end])
      booking_base_conditions.concat("(date_start BETWEEN (?) AND (?)) OR (date_end BETWEEN (?) AND (?)) OR ((?) BETWEEN date_start AND date_end) OR ((?) BETWEEN date_start AND date_end)")
      booking_params_array.push(startDate)
      booking_params_array.push(endDate)
      booking_params_array.push(startDate)
      booking_params_array.push(endDate)
      booking_params_array.push(startDate)
      booking_params_array.push(endDate)
      existing_booking = Booking.where(booking_params_array)
      unless existing_booking.empty?
        json_response "There is already a booking withing that range of dates", false, {}, :bad_request
        # json_response "There is already a booking withing that range of dates", false, {}, :unprocessable_entity
        return;
      end
    end
  end
#end of class
end
