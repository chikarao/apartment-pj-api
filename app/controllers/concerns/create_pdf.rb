module CreatePdf
  require 'prawn'
  require "base64"
  # require DocumentTranslation
  # field_objects and contract_name call in booking#create_contract or agreement#update
  # also called in agreement#update_agreement_fields
  # field_objects can come from params or DocumentField.where(agreement_id = agreement.id)
  # contract_name from params; corresponds to file name in assets/pdf/xxx.pdf
  # save_and_create comes from params
  def create_pdf(field_objects, contract_name, save_and_create, translation, document_language_code)
    # CombinePDF is for combine_pdf gem
    # get base agreement file from local directory (not used now)
    # pdf_base = CombinePDF.load(Rails.root.join("app/assets/pdf/#{contract_name}.pdf"))
    # get base agreement file with only base language on it from Cloudinary
    # contract name comes from object stored on the front end in constants/documents
    p "contract_name before Cloudinary download " + contract_name.to_s
    download = Cloudinary::Downloader.download(contract_name, :flags => :attachment)
    # Define path to base pdf
    path_base = Rails.root.join("public/system/temp_files/pdf_files/pdf_base.pdf")
    # convert encoding from Cloudinary's ASCII-8BIT encoding to UTF-8 encoding
    # p "download " + download.to_s
    # p "download encoding " + download.encoding.to_s
    # download.force_encoding('utf-8')
    # p "download encoding after encoding " + download.encoding.to_s
    # Create new File instance for writing in binary
    pdf_base = File.new(path_base, "wb")
    # p "pdf_base after new" + pdf_base.to_s
    pdf_base.write(download)
    pdf_base.close
    pdf_base = CombinePDF.load(path_base)
    # path for external font ttf
    # p "field_objects " + field_objects.to_s
    # p "contract_name " + contract_name.to_s
    # p "save_and_create " + save_and_create.to_s
    # p "translation " + translation.to_s
    # p "document_language_code " + document_language_code.to_s
    # Letter size 612 x 792
    # pdf = Prawn::Document.new(:margin => [0, 0, 0, 0], :page_size => [612, 792])
    # A4 size 595 x 841
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
    adjustment_input_y = 0.013
    adjustment_x_text_align = 0.005
    adjustment_y_text_align = 0.001
    # !!!!!!adjustment for margin on frontend and padding of input fields
    # Use slightly different adjustment for inputs
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
    # Push page number in array if not already in array.
  field_objects.each do |each|
    # document_field_params[:document_field].each do |each|
      if (!(document_pages_array.include? each["page"].to_i) && each["page"].to_i )
        document_pages_array.push(each["page"].to_i)
      end
      # p "!!!!!! document_pages_array: " + document_pages_array.to_s
  end
    # p 'in booking_controller, create_contract, eachField, document_pages_array: ' + document_pages_array.to_s

    #!!!!!! START RENDER OF PDF
    # for each page in params, go through params onces
    # if input field, rectangle, circle, draw each
    document_pages_max = document_pages_array.max
    page = 1
    (document_pages_max).times do
      # p "!!!!!!!!!!!!!!!!!!!!!!document_pages_max, document_pages_array.include?(page), document_pages_array, page" +" " + document_pages_max.to_s + " "+ document_pages_array.include?(page).to_s + " " + document_pages_array.to_s + " " + (page).to_s
      if document_pages_array.include?(page)
        field_objects.each do |eachField|
          # p "!!!!!!!!!!!!!!!!!!!!!! Writing page" + page.to_s
        # p "!!!!!! params[:document_field].each, eachField: " + eachField.to_s
        # p 'in booking_controller, create_contract, eachField,  eachField["page"], i: ' + params[eachField].to_s + " " + params[eachField]["page"].to_s + " " + i.to_s
        # p 'in booking_controller, create_contract, params[eachField]: ' + params[eachField].to_s
        # p 'in booking_controller, create_contract, params[eachField]["name"] eachField["input_type"] == "string" (eachField["val"] == "inputFieldValue"): ' + params[eachField]["name"].to_s + " " +  (params[eachField]["input_type"] == "string").to_s + " " + (params[eachField]["val"] == "inputFieldValue").to_s
        # p 'in booking_controller, create_contract, params[eachField]["name"] params[eachField]["input_type"] params[eachField]["val"]: ' + params[eachField]["name"].to_s + " " +  params[eachField]["input_type"].to_s + " " + params[eachField]["val"].to_s
        # draw input fields

        # p "!!!!!!!!!!!!!!!!!!!!!! Writing page" + page.to_s + " Inside if input_type == string..."
          if (eachField["input_type"] == "string" || eachField["input_type"] == "text" || eachField["input_type"] == "date") && (eachField["val"] == "inputFieldValue" || eachField["val"] == "true" || eachField["val"] == "false" || eachField["val"] == "t" || eachField["val"] == "f" ) && !eachField["text_align"] && eachField["class_name"] != "document-rectangle wrap-textarea" && eachField["page"].to_i == (page)
            x = eachField["left"].to_f / 100 + adjustment_x_text_align
            y = eachField["top"].to_f / 100 + adjustment_input_y
            hor_points = hor_total_inches * x * points_per_inch
            ver_points = ver_total_inches * (1 - y) * points_per_inch
            text_to_display = eachField["display_text"] ? eachField["display_text"] : eachField["value"]
            # draw_input(hor_points, ver_points, params[eachField["value"]], pdf, ipaex_gothic_path)
            pdf.font("IPAEX_GOTHIC") do
              pdf.draw_text text_to_display, :at => [hor_points, ver_points], :size => 10, :overflow => :shrink_to_fit
            end
          end

          # pdf.draw_text params[:address][:value], :at => [address_hor_points, address_ver_points], :size => 10
          if (eachField["input_type"] == "text" || eachField["input_type"] == "string") && eachField["class_name"] == "document-rectangle wrap-textarea" && eachField["val"] == "inputFieldValue" && eachField["page"].to_i == (page)
            x = eachField["left"].to_f / 100 + adjustment_x
            y = eachField["top"].to_f / 100 + adjustment_y_text_align
            hor_points = hor_total_inches * x * points_per_inch
            ver_points = ver_total_inches * (1 - y) * points_per_inch
            x_width = eachField["width"].to_f / 100
            hor_points_width = hor_total_inches * x_width * points_per_inch
            y_height = eachField["height"].to_f / 100
            ver_points_height = ver_total_inches * y_height * points_per_inch
            value = eachField["value"] ? eachField["value"] : ''
            text_to_display = eachField["display_text"] ? eachField["display_text"] : value
            # text_to_display = eachField["value"]
            # text_to_display = "HERE"
            pdf.font("IPAEX_GOTHIC") do
              pdf.text_box text_to_display, :at => [hor_points, ver_points], :width => hor_points_width, :height => ver_points_height, :valign => :top, :size => 10, :overflow => :shrink_to_fit, :minimum_font_size => 8
              # pdf.text_box text_to_display, :at => [hor_points, ver_points], :width => hor_points_width, :height => ver_points_height, :valign => :top, :size => 10, :overflow => :shrink_to_fit, :minimum_font_size => 8
            end
          end
          # end of string inputfield
          # For aligned text
          if (eachField["input_type"] == "string" || eachField["input_type"] =="text" || eachField["input_type"] =="date") && (eachField["val"] == "inputFieldValue" || eachField["val"] == "true" || eachField["val"] == "false" || eachField["val"] == "t" || eachField["val"] == "f" ) && eachField["text_align"] && eachField["page"].to_i == (page)
            x = eachField["left"].to_f / 100 + adjustment_x
            y = eachField["top"].to_f / 100 + adjustment_y_text_align
            hor_points = hor_total_inches * x * points_per_inch
            ver_points = ver_total_inches * (1 - y) * points_per_inch
            x_width = eachField["width"].to_f / 100
            hor_points_width = hor_total_inches * x_width * points_per_inch
            y_height = eachField["height"].to_f / 100
            # !!! NOTE ver_points_height is not (1 - y_height)
            ver_points_height = ver_total_inches * y_height * points_per_inch
            value = eachField["value"] ? eachField["value"] : ''
            text_to_display = eachField["display_text"] ? eachField["display_text"] : value
            # text_to_display = eachField["value"]
            # text_to_display = "HERE"
            # draw_input(hor_points, ver_points, params[eachField["value"]], pdf, ipaex_gothic_path)
            pdf.font("IPAEX_GOTHIC") do
              pdf.text_box text_to_display, :at => [hor_points, ver_points], :width => hor_points_width, :height => ver_points_height, :valign =>  :top, :align =>  eachField["text_align"].to_sym, :size => 10
            end
          end
          # end of string inputfield
          # draw rectagles for buttons WITHOUT enclosed text such as an "X"
          if (eachField["input_type"] == "button") && (eachField["class_name"] == "document-rectangle")  && !(eachField["enclosed_text"]) && (eachField["page"].to_i == (page))
            rectangle_x = eachField["left"].to_f / 100 + adjustment_x / 3;
            rectangle_y = eachField["top"].to_f / 100;
            rectangle_hor_points = hor_total_inches * rectangle_x * points_per_inch
            rectangle_ver_points = ver_total_inches * (1 - rectangle_y) * points_per_inch
            rectagle_width_points = hor_total_inches * eachField["width"].to_f / 100 * points_per_inch
            if eachField["value"] == eachField["val"]
              pdf.stroke do
                 pdf.rounded_rectangle [rectangle_hor_points, rectangle_ver_points], rectagle_width_points, 12, 5
              end
            end
          end
          # !!!!! enclosed_text Button!!!!
          if (eachField["input_type"] == "button") && (eachField["class_name"] == "document-rectangle") && eachField["enclosed_text"] && (eachField["page"].to_i == (page))
            x = eachField["left"].to_f / 100 + adjustment_x - 0.002
            y = eachField["top"].to_f / 100 + adjustment_input_y + 0.001
            hor_points = hor_total_inches * x * points_per_inch
            ver_points = ver_total_inches * (1 - y) * points_per_inch
            text_to_display = eachField["value"] != "" ? eachField["enclosed_text"] : eachField["value"]
            if eachField["value"] == eachField["val"]
              pdf.font("IPAEX_GOTHIC") do
                pdf.draw_text text_to_display, :at => [hor_points, ver_points], :size => 10
              end
            end
          end

          if (eachField["input_type"] == "button") && (eachField["class_name"] == "document-circle") && !(eachField["enclosed_text"]) && eachField["page"].to_i == (page)
            circle_x = eachField["left"].to_f / 100 + adjustment_x + additional_adjustment_circle_x
            circle_y = (1 - eachField["top"].to_f / 100) + adjustment_y - additional_adjustment_circle_y
            circle_hor_points = hor_total_inches * circle_x * points_per_inch
            circle_ver_points = ver_total_inches * circle_y * points_per_inch
            pdf.stroke_circle [circle_hor_points, circle_ver_points], 6
          end
        end
        # translations on agreement; translation comes from concerns/document_translation_fixed_term.rb
        # inside document
        if !translation.empty?
          translation[page].keys.each do |each_key|
            # adjustment_x = 0.01
            adjustment_x_translation = 0
            # accounts for top 0, left: 0 at upper left; points 0, 0 in PDF is left bottom
            # vertical y adjustment for circle
            # adjustment_y = 0.015
            adjustment_y_translation = 0.01
            adjustment_y_translation_rotate = 0
            adjustment_y_translation_align = 0
            if !translation[page][each_key][:attributes][:width]
              x = translation[page][each_key][:attributes][:left].to_f / 100 + adjustment_x_translation
              y = translation[page][each_key][:attributes][:top].to_f / 100 + adjustment_y_translation
              hor_points = hor_total_inches * x * points_per_inch
              ver_points = ver_total_inches * (1 - y) * points_per_inch
              # convert document_language_code to symbol to access hash
              text_to_display = translation[page][each_key][:translations][document_language_code.to_sym]
              # draw_input(hor_points, ver_points, params[eachField["value"]], pdf, ipaex_gothic_path)
              pdf.font("IPAEX_GOTHIC") do
                pdf.draw_text text_to_display, :at => [hor_points, ver_points], :size => 8
              end
            end
            # Rotating text
            if translation[page][each_key][:attributes][:rotate]
              x = translation[page][each_key][:attributes][:left].to_f / 100 + adjustment_x_translation
              y = translation[page][each_key][:attributes][:top].to_f / 100 + adjustment_y_translation_rotate
              hor_points = hor_total_inches * x * points_per_inch
              ver_points = ver_total_inches * (1 - y) * points_per_inch
              x_width = translation[page][each_key][:attributes][:width].to_f / 100
              hor_points_width = hor_total_inches * x_width * points_per_inch
              y_height = translation[page][each_key][:attributes][:height].to_f / 100
              # !!! NOTE ver_points_height is not (1 - y_height)
              ver_points_height = ver_total_inches * y_height * points_per_inch
              # convert document_language_code to symbol to access hash
              text_to_display = translation[page][each_key][:translations][document_language_code.to_sym]
              pdf.font("IPAEX_GOTHIC") do
                pdf.text_box text_to_display, :at => [hor_points, ver_points], :width => hor_points_width, :height => ver_points_height, :rotate => translation[page][each_key][:attributes][:rotate].to_i, :rotate_around => :upper_left, :size => 8
              end
            end

            if translation[page][each_key][:attributes][:text_align]
              x = translation[page][each_key][:attributes][:left].to_f / 100 + adjustment_x_translation
              y = translation[page][each_key][:attributes][:top].to_f / 100 + adjustment_y_translation_align
              hor_points = hor_total_inches * x * points_per_inch
              ver_points = ver_total_inches * (1 - y) * points_per_inch
              x_width = translation[page][each_key][:attributes][:width].to_f / 100
              hor_points_width = hor_total_inches * x_width * points_per_inch
              y_height = translation[page][each_key][:attributes][:height].to_f / 100
              # !!! NOTE ver_points_height is not (1 - y_height)
              ver_points_height = ver_total_inches * y_height * points_per_inch
              # convert document_language_code to symbol to access hash
              text_to_display = translation[page][each_key][:translations][document_language_code.to_sym]
              font_size = translation[page][each_key][:attributes][:font_size].to_f - 2
              pdf.font("IPAEX_GOTHIC") do
                pdf.text_box text_to_display, :at => [hor_points, ver_points], :width => hor_points_width, :height => ver_points_height, :valign =>  :top, :align => translation[page][each_key][:attributes][:text_align].to_sym, :size => font_size
              end
            end
          end
          # end translation[page].each
        end
      else
        # p "Writing skipped page" + page.to_s
        # pdf.font("IPAEX_GOTHIC") do
        #   pdf.draw_text "Skippped", :at => [100, 100], :size => 100
        # end
      end
      # end if document_pages_array includes page
      pdf.start_new_page
      page += 1
    end
    # end of document times do

    # pdf.stroke_axis()

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
    # p "!!!! Before PDF Merge document_pages_array: " + document_pages_array.to_s
    # document_pages_array.each_with_index do |eachPage, i|
    document_pages_array.each_with_index do |eachPage, i|
      # p "!!!! PDF Merge each_with_index: " + eachPage.to_s
      # pdf_base.pages[i]<< pdf_merge.pages[i]
      pdf_base.pages[(eachPage - 1)]<< pdf_merge.pages[(eachPage - 1)]
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
    result = Cloudinary::Uploader.upload(Rails.root.join("public/system/temp_files/pdf_files/pdf_combined.pdf"), :width => 792, :height => 1122)
    # p 'in booking_controller, create_contract, result: ' + result.to_s
    File.delete(path_merge)
    File.delete(path_base)
    unless save_and_create
      json_response "Created PDF successfully", true, {}, :ok
    else
      return result
    end
  end
end
