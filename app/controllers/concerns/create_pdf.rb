module CreatePdf
  require 'prawn'
  # require DocumentTranslation
  # IMPORTANT: field_objects and contract_name call in booking#create_contract or agreement#update
  # also called in agreement#update_agreement_fields, agreement#save_template_agreement_fields
  # field_objects can come from params or DocumentField.where(agreement_id = agreement.id)
  # contract_name from params; corresponds to file name in assets/pdf/xxx.pdf; Not used for templates
  # save_and_create comes from params
  ########################################
  # IMPORTANT: FLOW OF OPERATIONS
  # 1. Get PDF and insert downloaded from Cloudinary and assign to pdf_base (agreement.document_publicid) and pdf_insert (document_insert.publicid), respective
  # both files are saved locally to /public/system/temp_files/pdf_files
  # 2. Create and write each field on each specified page on pdf saved in temp_files as pdf_merge
  # 3. Write pdf_merge (pages with no fields skipped) onto pdf_base
  # 4. If there is an insert, create pdf_final and save in temp_files
  # Write pdf_merge and pdf_insert on each specified to pdf_final and upload to Cloudinary
  # 5. If there is no insert, save pdf_base as pdf_combined for upload to Cloudinary
  # 6. Get result from Cloudinary and return it, publicid will be saved as agreement.document_pdf_publicid
  ########################################

  def create_pdf(field_objects, contract_name, save_and_create, translation, document_language_code, document_insert_main, agreement, template_document_fields)
    # CombinePDF is for combine_pdf gem
    # get base agreement file from local directory (not applicable in template environment)
    # get base agreement file with only base language on it from Cloudinary (not applicable in template environment)
    # contract name comes from object stored on the front end in constants/documents (not applicable in template environment)

    # Insert enables user to insert a pdf within a pdf
    # insert is placeholder flag for indicating there is an inserted agreement for fixed term agreement
    insert = document_insert_main
    # Perform below only if insert is true
    if insert
      # placeholder for insert public_Id for cloudinary
      pdf_insert_public_id = document_insert_main.publicid
      # get number of pages for insert in cloudinary
      # pdf_insert_resource = Cloudinary::Api.resource(pdf_insert_public_id, :pages => true)
      # p "!!!!!!!create_pdf, pdf_insert_resource " + pdf_insert_resource.to_s
      # pdf_insert_pages = pdf_insert_resource["pages"]
      pdf_insert_pages = document_insert_main["pages"]
      pdf_insert_split_size_array = document_insert_main["page_size"].split(",")
      # pdf_insert_dimensions_array = [pdf_insert_resource["width"], pdf_insert_resource["height"]]
      pdf_insert_dimensions_array = [pdf_insert_split_size_array[0].to_i, pdf_insert_split_size_array[1].to_i]
      # Download the pdf from Cloudinary
      pdf_insert_download = Cloudinary::Downloader.download(pdf_insert_public_id, :flags => :attachment)
      # Define path to insert pdf in local temp directory
      path_insert = Rails.root.join("public/system/temp_files/pdf_files/pdf_insert.pdf")
      # convert encoding from Cloudinary's ASCII-8BIT encoding to UTF-8 encoding
      # Code used before to write and save file
      # p "download encoding " + download.encoding.to_s
      # download.force_encoding('utf-8')
      # p "download encoding after encoding " + download.encoding.to_s

      # Create new File instance for writing in binary
      pdf_insert = File.new(path_insert, "wb")
      pdf_insert.write(pdf_insert_download)
      pdf_insert.close
      # CombinePDF to prep pdf_insert to combine with other pdfs
      pdf_insert = CombinePDF.load(path_insert)
    end
    # END of if insert
    # download = Cloudinary::Downloader.download(contract_name, :flags => :attachment, :folder => "apartmentpj_constant_assets")
    # download = Cloudinary::Downloader.download(contract_name, :flags => :attachment)
    # !!!!!IMPORTANT: If working on template, use agreement document_publicid to get file from Cloudinary; Otherwise file from use constant-assets folder
    contract_name_with_folder = template_document_fields ? agreement.document_publicid + ".pdf" : "apartmentpj-constant-assets/" + contract_name + ".pdf"
    contract_name = template_document_fields ? agreement.document_publicid : contract_name
    # pdf_resource = Cloudinary::Api.resource(contract_name, :pages => true)
    # get dimensions of document
    # pdf_base_dimensions_array = [pdf_resource["width"], pdf_resource["height"]]
    pdf_split_size_array = agreement["document_page_size"].split(",")
    pdf_base_dimensions_array = [pdf_split_size_array[0].to_i, pdf_split_size_array[1].to_i]
    # pdf_base_pages = pdf_resource["pages"]
    pdf_base_pages = agreement["document_pages"]
    # p "!!!!!!!create_pdf, pdf_resource " + pdf_resource.to_s
    # get file from Cloudiary
    download = Cloudinary::Downloader.download(contract_name_with_folder, :flags => :attachment)
    # p "!!!!!!!create_pdf, download " + download.to_s
    # Define path to base pdf
    path_base = Rails.root.join("public/system/temp_files/pdf_files/pdf_base.pdf")
    pdf_base = File.new(path_base, "wb")
    # p "pdf_base after new" + pdf_base.to_s
    pdf_base.write(download)
    pdf_base.close
    pdf_base = CombinePDF.load(path_base)
    # Letter size 612 x 792 in pixels
    # pdf = Prawn::Document.new(:margin => [0, 0, 0, 0], :page_size => [612, 792])
    # A4 size 595 x 841 in pixels 72 ppi
    # pdf = Prawn::Document.new(:margin => [0, 0, 0, 0], :page_size => [595, 841])
    pdf = Prawn::Document.new(:margin => [0, 0, 0, 0], :page_size => pdf_base_dimensions_array)
    # pdf = Prawn::Document.new(:margin => [0, 0, 0, 0], :page_size => "A4")
    # A4 dimensions in inches
    points_per_inch = 72
    # 595 / 8.27 = 71.946795646916566
    hor_total_inches = pdf_split_size_array[0].to_i / 71.946795646916566
    ver_total_inches = pdf_split_size_array[1].to_i / 71.946795646916566
    # hor_total_inches = 8.27
    # ver_total_inches = 11.69
    # Prawn gem points per inch
    # font_inches_per_point = 0.0138889
    points_per_pixel = 0.75
    # !!!!!!adjustment for margin on frontend and padding of input fields
    # same horizontal x adjustment for input and circle
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
    # !!!!!!!!!!!!!!  FONTS !!!!!!!!!!!!!!!
    # Prawn has limted built-in fonts so need to assign ttf files hash in pdf
    # path for external font ttf; Any new fonts added put into this directory
    ipaex_gothic_path = Rails.root.join("app/assets/fonts/ipaexg.ttf")
    # define custom font in assets/fonts/ipaexg
    pdf.font_families["IPAEX_GOTHIC"] = {
                        :bold        => ipaex_gothic_path,
                        :italic      => ipaex_gothic_path,
                        :bold_italic => ipaex_gothic_path,
                        :normal      => ipaex_gothic_path
                      }
    # Prawn built-in fonts: in github prawn/lib/prawn/font/afm.rb
          # Courier Helvetica Times-Roman Symbol ZapfDingbats
          # Courier-Bold Courier-Oblique Courier-BoldOblique
          # Times-Bold Times-Italic Times-BoldItalic
          # Helvetica-Bold Helvetica-Oblique Helvetica-BoldOblique
    # map front end font families to backend available fonts, as Prawn font names do not fit with css fint names
    # Must get ttf files for all to get UTF-8 characters for all
    # For instance courier does not have Japanese fonts
    font_mapping_object = {
      "MSゴシック" => "IPAEX_GOTHIC",
      "ＭＳ Ｐ明朝" => "IPAEX_GOTHIC",
      "arial" => "IPAEX_GOTHIC",
      "times new roman" => "Times-Roman",
      "times" => "Times-Roman",
      "helvetica" => "Helvetica",
      "courier" => "Courier"
    }
    # Method for getting style that can be handled by Prawn
    get_font_and_style = lambda do |field|
      return_hash = {}
      style = :normal
      style = :bold if field["font_weight"] == 'bold' && field["font_style"] != 'italic'
      style = :bold_italic if field["font_weight"] == 'bold' && field["font_style"] == 'italic'
      style = :italic if field["font_weight"] != 'bold' && field["font_style"] == 'italic'
      # p 'in create_pdf get_font_and_style lambda field: ' + field.to_s
      return {font: font_mapping_object[field["font_family"]], style: style}
    end
    # font stles [:bold, :bold_italic, :italic, :normal].
    # get array of pages in document field attributes
    document_pages_array = []
    document_page_mapped_hash = {}
    # Push page number in array if not already in array.
    # Iterate through field_objects passed in function call parameter
    field_objects.each do |each|
      # document_field_params[:document_field].each do |each|
      if (!(document_pages_array.include? each["page"].to_i) && each["page"].to_i )
        document_pages_array.push(each["page"].to_i)
      end

      if document_page_mapped_hash[each["page"].to_i]
        document_page_mapped_hash[each["page"].to_i].push(each)
      else
        document_page_mapped_hash[each["page"].to_i] = [each]
      end
        # p "!!!!!! document_pages_array: " + document_pages_array.to_s
    end
    # p 'in booking_controller, create_contract, eachField, document_pages_array: ' + document_pages_array.to_s
    if template_document_fields
      document_page_mapped_hash = template_document_fields[:document_fields]
      document_pages_array = document_page_mapped_hash.keys
      translation_fields_mapped = template_document_fields[:translation]
    else
      translation_fields_mapped = translation
    end
    #!!!!!! START RENDER OF FIELDS ON PDF
    # for each page in params, go through params onces
    # if input field, rectangle, circle, draw each
    document_pages_max = document_pages_array.max
    page = 1
    (document_pages_max).times do
      # p "!!!!!!!!!!!!!!!!!!!!!!document_pages_max, document_pages_array.include?(page), document_pages_array, page" +" " + document_pages_max.to_s + " "+ document_pages_array.include?(page).to_s + " " + document_pages_array.to_s + " " + (page).to_s
      if document_pages_array.include?(page)
        # field_objects.each do |eachField|
        document_page_mapped_hash[page].each do |eachField|
        # draw input fields
        # p "!!!!!!!!!!!!!!!!!!!!!! Writing page" + page.to_s + " Inside if input_type == string..."
          if (eachField["input_type"] == "string" || eachField["input_type"] == "text" || eachField["input_type"] == "date") && (eachField["val"] == nil || eachField["val"] == "inputFieldValue" || eachField["val"] == "true" || eachField["val"] == "false" || eachField["val"] == "t" || eachField["val"] == "f" ) && !eachField["text_align"] && eachField["class_name"] != "document-rectangle wrap-textarea" && eachField["page"].to_i == (page)
            # p "!!!!!!!!!!!! In create_pdf, input string, first, eachField.name, eachField.font_size: " + eachField["name"].to_s + ' ' + eachField["font_size"].to_f.to_s
            x = eachField["left"].to_f / 100 + adjustment_x_text_align
            y = eachField["top"].to_f / 100 + adjustment_input_y
            x = eachField["left"].to_f / 100 + adjustment_x_text_align + 0.001 if template_document_fields
            y = eachField["top"].to_f / 100 + adjustment_input_y - 0.001 if template_document_fields
            # x = eachField["left"].to_f / 100 if template_document_fields
            # y = (eachField["top"].to_f / 100) + ((eachField["height"].to_f / 100) / 2) if template_document_fields
            hor_points = hor_total_inches * x * points_per_inch
            ver_points = ver_total_inches * (1 - y) * points_per_inch
            text_to_display = eachField["display_text"] ? eachField["display_text"] : eachField["value"]
            font_and_style = get_font_and_style.call(eachField)
            # p 'in create_pdf eachField.name, eachField.font_family font_and_style: ' + eachField["name"].to_s + ' ' + eachField["font_family"].to_s + ' ' + font_and_style.to_s
            # draw_input(hor_points, ver_points, params[eachField["value"]], pdf, ipaex_gothic_path)
            if template_document_fields
              font_size_in_points = eachField["font_size"].to_f * points_per_pixel
              # pdf.font("IPAEX_GOTHIC") do
              pdf.font(font_and_style[:font]) do
                # pdf.draw_text text_to_display, :at => [hor_points, ver_points], :size => eachField["font_size"].to_f, :overflow => :shrink_to_fit
                pdf.draw_text text_to_display, :at => [hor_points, ver_points], :size => font_size_in_points, :overflow => :shrink_to_fit, :style => font_and_style[:style]
              end
            else
              # pdf.font("IPAEX_GOTHIC") do
              pdf.font(font_and_style[:font]) do
                pdf.draw_text text_to_display, :at => [hor_points, ver_points], :size => 10, :overflow => :shrink_to_fit, :style => font_and_style[:style]
              end
            end
          end

          # pdf.draw_text params[:address][:value], :at => [address_hor_points, address_ver_points], :size => 10
          if (eachField["input_type"] == "text" || eachField["input_type"] == "string") && eachField["class_name"] == "document-rectangle wrap-textarea" && eachField["val"] == "inputFieldValue" && eachField["page"].to_i == (page)
            # p "!!!!!!!!!!!! In create_pdf, input string, second, eachField.name, eachField.font_size: " + eachField["name"].to_s + ' ' + eachField["font_size"].to_f.to_s
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
            if template_document_fields
              pdf.font("IPAEX_GOTHIC") do
                pdf.text_box text_to_display, :at => [hor_points, ver_points], :width => hor_points_width, :height => ver_points_height, :valign => :top, :size => eachField["font_size"].to_f, :overflow => :shrink_to_fit, :minimum_font_size => 8
                # pdf.text_box text_to_display, :at => [hor_points, ver_points], :width => hor_points_width, :height => ver_points_height, :valign => :top, :size => 10, :overflow => :shrink_to_fit, :minimum_font_size => 8
              end
            else
              pdf.font("IPAEX_GOTHIC") do
                pdf.text_box text_to_display, :at => [hor_points, ver_points], :width => hor_points_width, :height => ver_points_height, :valign => :top, :size => 10, :overflow => :shrink_to_fit, :minimum_font_size => 8
                # pdf.text_box text_to_display, :at => [hor_points, ver_points], :width => hor_points_width, :height => ver_points_height, :valign => :top, :size => 10, :overflow => :shrink_to_fit, :minimum_font_size => 8
              end
            end
          end
          # end of string inputfield
          # For aligned text
          if (eachField["input_type"] == "string" || eachField["input_type"] =="text" || eachField["input_type"] =="date") && (eachField["val"] == "inputFieldValue" || eachField["val"] == "true" || eachField["val"] == "false" || eachField["val"] == "t" || eachField["val"] == "f" ) && eachField["text_align"] && eachField["page"].to_i == (page)
            # p "!!!!!!!!!!!! In create_pdf, input string, third, eachField.name, eachField.font_size: " + eachField["name"].to_s + ' ' + eachField["font_size"].to_f.to_s
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
          if (eachField["input_type"] == "button") && (eachField["class_name"] == "document-rectangle" || eachField["class_name"] === "document-rectangle-template-button") && !(eachField["enclosed_text"]) && (eachField["page"].to_i == (page))
            rectangle_x = eachField["left"].to_f / 100 + adjustment_x / 3
            rectangle_x = eachField["left"].to_f / 100 if template_document_fields
            rectangle_y = eachField["top"].to_f / 100;
            rectangle_hor_points = hor_total_inches * rectangle_x * points_per_inch
            rectangle_ver_points = ver_total_inches * (1 - rectangle_y) * points_per_inch
            rectagle_width_points = hor_total_inches * (eachField["width"].to_f / 100) * points_per_inch
            rectagle_height_points = ver_total_inches * (eachField["height"].to_f / 100) * points_per_inch
            if eachField["value"] == eachField["val"]
              if template_document_fields
                pdf.stroke do
                  # provie top, left, width, height, and border radius
                  pdf.rounded_rectangle [rectangle_hor_points, rectangle_ver_points], rectagle_width_points, rectagle_height_points, 3
                end
              else
                pdf.stroke do
                  pdf.rounded_rectangle [rectangle_hor_points, rectangle_ver_points], rectagle_width_points, 12, 5
                end
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

          if (eachField["input_type"] == "button") && (eachField["class_name"] == "document-circle" || eachField["class_name"] == "document-circle-template") && !(eachField["enclosed_text"]) && eachField["page"].to_i == (page)
            # If document_fields are template_document_fields do below, otherwise, do static document
            if template_document_fields
              # Get the radius in fraction
              radius_x = (eachField["width"].to_f / 100) / 2
              radius_y = (eachField["height"].to_f / 100) / 2
              # Get the left and top in fraction and add radius since Prawn sets left and top as the center of the circle
              circle_x = (eachField["left"].to_f / 100) + radius_x
              circle_y = (1 - ((eachField["top"].to_f / 100) + radius_y))
              # Get horizontal and vertical points (center of circle)
              circle_hor_points = hor_total_inches * circle_x * points_per_inch
              circle_ver_points = ver_total_inches * circle_y * points_per_inch
              # Get size of circle in radius points
              circle_size_points = hor_total_inches * radius_x * points_per_inch
              # p "!!!!!!!!!!!! In create_pdf, button, document-circle-template, eachField, radius_x, radius_y, circle_x, circle_y: " + eachField.to_s + ' ' + radius_x.to_s + ' ' + radius_y.to_s + ' ' + circle_x.to_s + ' ' + circle_y.to_s
              if eachField["value"] == eachField["val"]
                # pdf.stroke_circle [circle_hor_points, circle_ver_points], 6
                pdf.stroke_circle [circle_hor_points, circle_ver_points], circle_size_points
              end
            else
              # Logic for static
              circle_x = eachField["left"].to_f / 100 + adjustment_x + additional_adjustment_circle_x
              circle_y = (1 - eachField["top"].to_f / 100) + adjustment_y - additional_adjustment_circle_y
              circle_hor_points = hor_total_inches * circle_x * points_per_inch
              circle_ver_points = ver_total_inches * circle_y * points_per_inch
              if eachField["value"] == eachField["val"]
                pdf.stroke_circle [circle_hor_points, circle_ver_points], 6
              end
            end
          end
        end
        # translations on agreement; translation comes from concerns/document_translation_fixed_term.rb
        # inside document
        if !translation_fields_mapped.empty?
        # if !translation.empty?
          translation_fields_mapped[page].keys.each do |each_key|
          # translation_fields_mapped[page].keys.each do |each_key|
            # adjustment_x = 0.01
            adjustment_x_translation = 0
            # accounts for top 0, left: 0 at upper left; points 0, 0 in PDF is left bottom
            # vertical y adjustment for circle
            # adjustment_y = 0.015
            adjustment_y_translation = 0.01
            adjustment_y_translation_rotate = 0
            adjustment_y_translation_align = 0
            # IMPORTANT!!!! template translation have width !!!!!!!!!
            # if translation_fields_mapped[page][each_key][:attributes][:width]
            # p "!!!!!!!!!!!! In create_pdf,translation_fields_mapped[page].keys.each do,  translation_fields_mapped[page][each_key]: " +  translation_fields_mapped[page][each_key].to_s
            font_and_style = get_font_and_style.call({
              "font_family" => translation_fields_mapped[page][each_key][:attributes][:font_family],
              "font_weight" => translation_fields_mapped[page][each_key][:attributes][:font_weight],
              "font_style" => translation_fields_mapped[page][each_key][:attributes][:font_style]
              })
              font_size_in_points = translation_fields_mapped[page][each_key][:attributes][:font_size].to_f * points_per_pixel

            if translation_fields_mapped[page][each_key][:attributes][:width] && !translation_fields_mapped[page][each_key][:attributes][:rotate]
              x = translation_fields_mapped[page][each_key][:attributes][:left].to_f / 100 + adjustment_x_translation
              y = translation_fields_mapped[page][each_key][:attributes][:top].to_f / 100 + adjustment_y_translation
              x = translation_fields_mapped[page][each_key][:attributes][:left].to_f / 100 + adjustment_x_translation + 0.006 if template_document_fields
              y = translation_fields_mapped[page][each_key][:attributes][:top].to_f / 100 + adjustment_y_translation + 0.001 if template_document_fields
              hor_points = hor_total_inches * x * points_per_inch
              ver_points = ver_total_inches * (1 - y) * points_per_inch
              # convert document_language_code to symbol to access hash
              text_to_display = translation_fields_mapped[page][each_key][:translations][document_language_code.to_sym]
              # draw_input(hor_points, ver_points, params[eachField["value"]], pdf, ipaex_gothic_path)
              # p "!!!!!! create_pdf, in translation no width translation_fields_mapped[page][each_key], hor_points, ver_points, translation_fields_mapped[page][each_key][:attributes][:width]: " + translation_fields_mapped[page][each_key].to_s + ' ' + hor_points.to_s + ' ' + hor_points.to_s + ' ' + translation_fields_mapped[page][each_key][:attributes][:width].to_s
              # p "!!!!!!!!!!!! In create_pdf,translation_fields_mapped[page].keys.each do,  font_and_style: " +  font_and_style.to_s

              if template_document_fields
                # pdf.font("IPAEX_GOTHIC") do
                pdf.font(font_and_style[:font]) do
                  pdf.draw_text text_to_display, :at => [hor_points, ver_points], :size => font_size_in_points, :style => font_and_style[:style]
                end
              else
                # pdf.font("IPAEX_GOTHIC") do
                pdf.font(font_and_style[:font]) do
                  pdf.draw_text text_to_display, :at => [hor_points, ver_points], :size => 8, :style => font_and_style[:style]
                end
              end
            end

            if !translation_fields_mapped[page][each_key][:attributes][:width]
              x = translation_fields_mapped[page][each_key][:attributes][:left].to_f / 100 + adjustment_x_translation
              y = translation_fields_mapped[page][each_key][:attributes][:top].to_f / 100 + adjustment_y_translation
              hor_points = hor_total_inches * x * points_per_inch
              ver_points = ver_total_inches * (1 - y) * points_per_inch
              # convert document_language_code to symbol to access hash
              text_to_display = translation_fields_mapped[page][each_key][:translations][document_language_code.to_sym]
              # draw_input(hor_points, ver_points, params[eachField["value"]], pdf, ipaex_gothic_path)
              # p "!!!!!! create_pdf, in translation no width translation_fields_mapped[page][each_key], hor_points, ver_points, translation_fields_mapped[page][each_key][:attributes][:width]: " + translation_fields_mapped[page][each_key].to_s + ' ' + hor_points.to_s + ' ' + hor_points.to_s + ' ' + translation_fields_mapped[page][each_key][:attributes][:width].to_s
              pdf.font("IPAEX_GOTHIC") do
                pdf.draw_text text_to_display, :at => [hor_points, ver_points], :size => 8
              end
            end
            # Rotating text
            if translation_fields_mapped[page][each_key][:attributes][:rotate]
              adjustment = 0.005
              rotate = translation_fields_mapped[page][each_key][:attributes][:rotate].to_i
              rotate_map_hash = {
                # 0 => { x_adj: 0, y_adj: -adjustment },
                0 => { x_adj: adjustment + 0.001, y_adj: 0.003 },
                90 => { x_adj: (-adjustment - 0.001), y_adj: adjustment },
                180 => { x_adj: (-adjustment - 0.005), y_adj: -adjustment },
                270 => { x_adj: adjustment, y_adj: (-adjustment - 0.002) },
              }
              local_adjustment_x = rotate_map_hash[rotate][:x_adj]
              local_adjustment_y = rotate_map_hash[rotate][:y_adj]
              x = translation_fields_mapped[page][each_key][:attributes][:left].to_f / 100 + adjustment_x_translation + local_adjustment_x
              y = translation_fields_mapped[page][each_key][:attributes][:top].to_f / 100 + adjustment_y_translation_rotate + local_adjustment_y
              x = translation_fields_mapped[page][each_key][:attributes][:left].to_f / 100 + adjustment_x_translation if !template_document_fields
              y = translation_fields_mapped[page][each_key][:attributes][:top].to_f / 100 + adjustment_y_translation_rotate if !template_document_fields
              p "create_pdf rotate, local_adjustment_x, local_adjustment_y, x, y: " + rotate.to_s + ' ' + local_adjustment_x.to_s + ' ' + local_adjustment_y.to_s + ' ' + x.to_s + ' ' + y.to_s

              hor_points = hor_total_inches * x * points_per_inch
              ver_points = ver_total_inches * (1 - y) * points_per_inch
              x_width = translation_fields_mapped[page][each_key][:attributes][:width].to_f / 100
              hor_points_width = hor_total_inches * x_width * points_per_inch
              y_height = translation_fields_mapped[page][each_key][:attributes][:height].to_f / 100
              # !!! NOTE ver_points_height is not (1 - y_height)
              ver_points_height = ver_total_inches * y_height * points_per_inch
              # convert document_language_code to symbol to access hash
              text_to_display = translation_fields_mapped[page][each_key][:translations][document_language_code.to_sym]

              if template_document_fields
                # pdf.font("IPAEX_GOTHIC") do
                pdf.font(font_and_style[:font]) do
                  pdf.text_box text_to_display, :at => [hor_points, ver_points], :width => hor_points_width, :height => ver_points_height, :rotate => 360 - translation_fields_mapped[page][each_key][:attributes][:rotate].to_i, :rotate_around => :upper_left, :size => font_size_in_points, :style => font_and_style[:style]
                end
              else
                pdf.font("IPAEX_GOTHIC") do
                  pdf.text_box text_to_display, :at => [hor_points, ver_points], :width => hor_points_width, :height => ver_points_height, :rotate => translation_fields_mapped[page][each_key][:attributes][:rotate].to_i, :rotate_around => :upper_left, :size => 8, :style => font_and_style[:style]
                end
              end
            end

            if translation_fields_mapped[page][each_key][:attributes][:text_align]
              x = translation_fields_mapped[page][each_key][:attributes][:left].to_f / 100 + adjustment_x_translation
              y = translation_fields_mapped[page][each_key][:attributes][:top].to_f / 100 + adjustment_y_translation_align
              hor_points = hor_total_inches * x * points_per_inch
              ver_points = ver_total_inches * (1 - y) * points_per_inch
              x_width = translation_fields_mapped[page][each_key][:attributes][:width].to_f / 100
              hor_points_width = hor_total_inches * x_width * points_per_inch
              y_height = translation_fields_mapped[page][each_key][:attributes][:height].to_f / 100
              # !!! NOTE ver_points_height is not (1 - y_height)
              ver_points_height = ver_total_inches * y_height * points_per_inch
              # convert document_language_code to symbol to access hash
              text_to_display = translation_fields_mapped[page][each_key][:translations][document_language_code.to_sym]
              font_size = translation_fields_mapped[page][each_key][:attributes][:font_size].to_f - 2
              p "!!!!!! create_pdf, in translation text align translation_fields_mapped[page][each_key], hor_points, ver_points: " + translation_fields_mapped[page][each_key].to_s + ' ' + hor_points.to_s + ' ' + hor_points.to_s
              pdf.font("IPAEX_GOTHIC") do
                pdf.text_box text_to_display, :at => [hor_points, ver_points], :width => hor_points_width, :height => ver_points_height, :valign =>  :top, :align => translation_fields_mapped[page][each_key][:attributes][:text_align].to_sym, :size => font_size
              end
            end
          end
          # end translation_fields_mapped[page].each
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
    end # end of document times do
    # At this point, pdf has fields rendered on their respective pages (pages with no fields skipped)
    # pdf.stroke_axis()
    path_merge = Rails.root.join("public/system/temp_files/pdf_files/pdf_merge.pdf")
    # Save pdf with fields rendered as pdf_merge (number of pages same as pdf_base (agreement.document_publicid))
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

    # Write pdf_merge to pdf_base (agreement.document_publicid)
    # pages on PDFs start with zero so -1 to get index
    document_pages_array.each_with_index do |eachPage, i|
      # p "!!!! PDF Merge each_with_index: " + eachPage.to_s
      # pdf_base.pages[i]<< pdf_merge.pages[i]
      pdf_base.pages[(eachPage - 1)] << pdf_merge.pages[(eachPage - 1)]
    end # end of document_pages_array.each_with_index do |eachPage, i|
    # PERFORM only if insert is true and there is an inserted agreement
    if insert
      # create pdf_f with specified # pages to take content from pdf_base
      # pdf_f = Prawn::Document.new(:margin => [0, 0, 0, 0], :page_size => [595, 841])
      pdf_f = Prawn::Document.new(:margin => [0, 0, 0, 0], :page_size => pdf_insert_dimensions_array)
      # -1 to start page one less time than total pages
      # (document_pages_array.length + pdf_insert_pages - 1).times do
      pdf_insert_pages_array = []
      # p "!!!!!!!create_pdf, in if insert pdf_insert_pages: " + pdf_insert_pages.to_s
      # p "!!!!!!!create_pdf, in if insert pdf_base_pages: " + pdf_base_pages.to_s
      # p "!!!!!!!create_pdf, in if insert pdf_base.pages: " + pdf_base.pages.to_s
      # Get total number of pdf_final pages before creating pdf_f
      pdf_final_pages = pdf_base_pages + pdf_insert_pages
      (pdf_final_pages - 1).times do
        pdf_f.start_new_page
      end
      # Save pdf_f as pdf_final in local temp_files
      path_final = Rails.root.join("public/system/temp_files/pdf_files/pdf_final.pdf")
      pdf_f.render_file(path_final)
      # p "!!!! pdf_f: " + pdf_f.to_s
      pdf_final = CombinePDF.load(path_final)
      # p "!!!! pdf_final.pages: " + pdf_final.pages.to_s
      # transpose_base_to_final = lambda do |field|
      # end

      insert_pages = lambda do |insert_after_page|
        # template logic
        count_insert = 0
        count_base = 0
        pdf_final_pages.times do |i|
          # i and pdf page are both indexes starting with 0; page does not start with zero non-zero integer
          # if ((i + 1) > insert["insert_after_page"]) && ((i + 1) <= insert["insert_after_page"] + pdf_insert_pages)
          if ((i + 1) > insert_after_page) && ((i + 1) <= insert_after_page + pdf_insert_pages)
            # Transpose pdf_insert pages if i + 1 is within insert_after_page and insert_after_page + pdr_insert_pages
            pdf_final.pages[i] << pdf_insert.pages[count_insert]
            # Keep count of insert pages transposed; transposed in consecutive order
            count_insert += 1
            # elsif document_pages_array.include?(adjusted_base_page)
          else
            # p "!!!!!!!create_pdf, in if else insert_after_page, adjusted_base_page, count_base, insert_after_page, pdf_base_pages, pdf_insert_pages: " + count_base.to_s + ' ' + insert["insert_after_page"].to_s + ' ' + pdf_base_pages.to_s + ' ' + pdf_insert_pages.to_s
            pdf_final.pages[i] << pdf_base.pages[count_base]
            # Keep count of base pages; Transpose pages in order after skipping to transpose insert pages
            count_base += 1
          end
        end # END of pdf_final_pages.times do |i|

      end

      # If template document, user params for insert_after_page; Else on static documents use next to last page
      if insert["insert_after_page"]
        insert_pages.call(insert["insert_after_page"])
        # insert_after_page = template_document_fields ? insert["insert_after_page"] : pdf_base_pages - 1
      else
        insert_after_page_static = pdf_base_pages - 1
        insert_pages.call(insert_after_page_static)
      end

      # else # if no insert_after_page, insert before last page (static documents has signature page last)
      #   # page number of the last page in document pages array
      #   last_page = pdf_base_pages
      #   # last_page = document_pages_array.sort.last
      #   count = 0
      #   # assign last page of inserted, combined file
      #   # pdf_final_last_page_index = document_pages_array.length + pdf_insert_pages - 1
      #   pdf_final_last_page_index = pdf_base_pages + pdf_insert_pages - 1
      #   # iterate through each page in array
      #   document_pages_array.each do |eachPage|
      #     # unless eachPage is the last page
      #     if eachPage == last_page
      #       # if last page, transpose the last page
      #       pdf_final.pages[pdf_final_last_page_index] << pdf_base.pages[(eachPage - 1)]
      #     else
      #       # transpose the index of each page in array
      #       pdf_final.pages[(eachPage - 1)] << pdf_base.pages[(eachPage - 1)]
      #     end
      #     count += 1
      #   end
      #
      #   count = 0
      #   count_insert = 0
      #   # Iterate for number of pages in the combined document and agreement
      #   (document_pages_array.length + pdf_insert_pages).times do
      #     # if the count is not in the document array AND NOT the last page of the document
      #     if !document_pages_array.include?((count + 1)) && (count != pdf_final_last_page_index)
      #       # Transpose the insert into the blank pages of pdf final with the needed pages in pdf_base
      #       pdf_final.pages[count] << pdf_insert.pages[count_insert]
      #       # increment count_insert to get ready for the next page to transpose
      #       count_insert += 1
      #     end
      #     # increment count to go to to the next page of the combined document
      #     count += 1
      #   end # END of (document_pages_array.length + pdf_insert_pages).times do
      # end # END of if !insert["insert_after_page"]

      # save pdf final as combined.pdf
      pdf_final.save(Rails.root.join("public/system/temp_files/pdf_files/pdf_combined.pdf"))

    else # ELSE of if insert
      # save pdf base as pdf_combined unless insert is true and there is an inserted agreement in place of the standard agreement
      pdf_base.save(Rails.root.join("public/system/temp_files/pdf_files/pdf_combined.pdf"))
    end # END of if insert
    # If there is no insert save pdf_base as pdf_combined, why not do else ?
    # unless insert
    # end # END of unless insert
    # KEEP
    # path = Rails.root.join("public/system/temp_files/pdf_files", pdf)
    # path_combined = Rails.root.join("public/system/temp_files/pdf_files/pdf_combined.pdf")
    # keep
    # file = File.open(path_combined)
    # p "SENDGRID_USERNAME: #{ENV['SENDGRID_USERNAME']}"
    # p "SENDGRID_PASSWORD: #{ENV['SENDGRID_PASSWORD']}"
    # Send PDF as attachment!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    # UserNotifier.send_contract_email(path_combined, user).deliver
    # keep
    # result = Cloudinary::Uploader.upload(Rails.root.join("public/system/temp_files/pdf_files/pdf_combined.pdf"))
    result = Cloudinary::Uploader.upload(Rails.root.join("public/system/temp_files/pdf_files/pdf_combined.pdf"), :width => 792, :height => 1122)
    p 'in create_pdf, save_and_create result: ' + save_and_create.to_s + ' ' + result.to_s
    if insert
      File.delete(path_final)
      File.delete(path_insert)
    end

    File.delete(path_merge)
    File.delete(path_base)
    unless save_and_create
      if result
        json_response "Created PDF successfully", true, {cloudinary_result: result}, :ok
      else
        json_response "Create PDF failed", false, {}, :unprocessable_entity
      end
    else
      return result
    end
  end
end
