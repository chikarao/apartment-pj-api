desc 'Create Standard Documents, Rental and Important Points'
task :create_standard_documents  => :environment do
  Dir.glob("#{Rails.root}/app/models/*.rb").each { |file| require file }
 # Require the by page hashes
  require Dir.glob("#{Rails.root}/app/controllers/concerns/fixed_term_rental_contract_bilingual_all_by_page.rb")[0]
  require Dir.glob("#{Rails.root}/app/controllers/concerns/important_points_explanation_bilingual_all_by_page.rb")[0]
  require Dir.glob("#{Rails.root}/app/controllers/concerns/document_translation_fixed_term_by_page.rb")[0]
  require Dir.glob("#{Rails.root}/app/controllers/concerns/document_translation_important_points_by_page.rb")[0]

  puts 'Creating standard documents...'
  session = ActionDispatch::Integration::Session.new(Rails.application)
  puts 'Creating standard documents...session: ' + session.to_s
 # ApplicationController.allow_forgery_protection = false
 # app.post('/sign_in', {"user"=>{"login"=>"login", "password"=>"password"}})
 # app.post('/users/sign_in', {params: {"email"=>"test1@test.com", "password"=>""}})
  class_name_conversion = {
    "document-rectangle" => "document-rectangle-template",
    "document-circle" => "document-circle-template",
  }

  input_field_style_hash = {
    height: '1.6%',
    font_style: "normal",
    font_size: "12px",
    border_color: "lightgray",
    input_type: "text",
    font_family: "arial",
    font_weight: "normal",
    transform_origin: 'top left',
    transform: nil
  }

  select_and_button_field_style_hash = {
    # width: '10%',
    class_name: 'document-rectangle-template',
    # height: '1.6%',
    font_style: "normal",
    font_size: "12px",
    # border: '1px solid black',
    border_color: "lightgray",
    input_type: "button",
    # input_type: "string",
    font_family: "arial",
    font_weight: "normal",
    transform_origin: 'top left',
  }

  true_false_button_field_style_hash = {
    # width: '10%',
    class_name: 'document-rectangle-template',
    # height: '1.6%',
    # font_style: "normal",
    # font_size: "12px",
    # border: '1px solid black',
    border_color: "lightgray",
    input_type: "button",
    # input_type: "string",
    # font_family: "arial",
    # font_weight: "normal",
    # transform_origin: 'top left',
  }
  # select_and_button_choice_style_hash for document_field_choice with
  select_and_button_choice_style_hash = {
    # width: '10%',
    class_name: 'document-rectangle-template-button',
    height: '2.0%',
    # width: '12%',
    font_style: "normal",
    font_size: "12px",
    border: '1px solid black',
    border_color: "lightgray",
    input_type: "button",
    font_family: "arial",
    font_weight: "normal",
    transform_origin: 'top left',
  }

  select_choices_keys_hash = {
    :value => true,
    :val => true
  }

  each_rectangle_button_field_style_hash = {
    border: "1px solid black",
    class_name: 'document-rectangle-template-button',
    height: '2.0%',
    font_size: '12px',
  }

  each_true_false_circle_button_field_style_hash = {
    border_radius: '50%',
    border: "1px solid black",
    height: '1.6%',
    class_name: "document-circle-template",
  }

  translation_input_override_hash = {
    font_size: "12px",
    class_name: "document-rectangle-template"
  }

  button_element_dimension_adjustment_hash = {
    circle: {
      left: 0.55,
    },
    rectangle: {
      left: 0.65,
      top: -0.3
    }
  }

  translation_input_adjustment_hash = {
    left: -0.75
  }

  # Initialize so can be used in lambda as global variable
  document_field_dimensions = {
    left: 0,
    top: 0,
    width: 0,
    height: 0
  }
  # Initialize so can be used in lambda as global variable
  # Strat with extremes to increment
  left_most = 100
  top_most = 100
  right_most = 0
  bottom_most = 0
  # Tallies the size of the document_field based on location and dimention of each document_field_choice
  tally_document_field_dimensions = lambda do |dimensions_hash|
    # puts 'In tally_document_field_dimensions, name dimensions_hash: ' + dimensions_hash.to_s
    current_right = dimensions_hash[:left] + dimensions_hash[:width]
    current_bottom = dimensions_hash[:top] + dimensions_hash[:height]
    # Move tallies initially set at extreme values
    left_most = left_most >= dimensions_hash[:left] ? dimensions_hash[:left] : left_most
    top_most = top_most >= dimensions_hash[:top] ? dimensions_hash[:top] : top_most
    right_most = right_most >= current_right ? right_most : current_right
    bottom_most = bottom_most >= current_bottom ? bottom_most : current_bottom

    document_field_dimensions = {
      left: left_most,
      top: top_most,
      width: right_most - left_most,
      height: bottom_most - top_most
    }
    # puts 'In tally_document_field_dimensions, name document_field_dimensions: ' + name.to_s + document_field_dimensions.to_s
  end # tally_document_field_dimensions = lambda do |left, top, width, height |


  document_field_array = []
  count = 0


  create_document_field_array = lambda do |by_page_hash, document_type|

    by_page_hash.keys.each do |each_page|
      puts 'In create_document_field_array, working on: ' + document_type + " " + each_page.to_s
      by_page_hash[each_page].each do |each_document_field|
        # Flag for having only one input field (i.e. no document_field_choices) so do not need to assign document_field_dimensions
        one_input_document_field = false

        # each_document_field is somehow an array
        name = each_document_field[0].to_s
        name.slice!("_1") if name.include?("_1")
        name.slice!("_2") if name.include?("_2")
        name.slice!("_3") if name.include?("_3")
        name.slice!("_4") if name.include?("_4")
        # puts 'In create_document_field_array, working on name, name.class: ' + name.to_s + " " + name.class.to_s

        each_document_field_hash = each_document_field[1]
        if each_page == 1 || each_page == 2 # for running a subset of document_field from all file
        # if each_document_field_hash[:sample]

        # if each_document_field_hash[:sample] # for running a subset of document_field from all file
          puts 'In create_document_field_translation_array, working on: ' + document_type + " " + each_page.to_s + " " + name.to_s
        # initialize for each_document_field
        document_field_dimensions = {
          left: 0,
          top: 0,
          width: 0,
          height: 0
        }

        left_most = 100
        top_most = 100
        right_most = 0
        bottom_most = 0

        # puts 'In create_document_field_array, each name, each_document_field_hash, each_document_field_hash[:sample]: ' + name + ' ' + each_document_field_hash.to_s + " " + each_document_field_hash[:sample].to_s
        # puts 'Working on a document field array, name, each_document_field_hash, each_document_field_hash.sample: ' + name.to_s + each_document_field_hash.to_s + ' ' + each_document_field_hash[:sample].to_s if name == 'foundation'
        # General Workings:
        # create a new hash for each document field
        # iterate through each document field choice in document field
        # create array of document field choices
        # create new hash for each document field choice
        # if selectChoices, create array of selectChoices
        # create new hash for each selectChoice
        # push each document field into document_field_array
        new_document_field_hash = {
          name: name,
          # name: each_document_field_hash[:name],
          input_type: each_document_field_hash[:input_type],
          class_name: class_name_conversion[each_document_field_hash[:class_name].to_s] ? class_name_conversion[each_document_field_hash[:class_name].to_s] : each_document_field_hash[:class_name],
          component: each_document_field_hash[:component],
          value: nil,
          page: each_page
        }

        new_document_field_choices_array = []

        each_document_field_hash[:choices].keys.each do |each_choice|
          # start new_document_field_choice with nil so can push into array if populated later
          new_document_field_choice = nil
          button_choice = false
          # if choice is an input field or a select choice
          if each_choice.to_s == "inputFieldValue" || each_choice.to_s == "documentAttributes"
            # If not select choices
            if !each_document_field_hash[:choices][each_choice][:selectChoices] && each_document_field_hash[:choices].keys.length == 1
              # Merge the params with the new_document_field_hash
              new_document_field_hash.merge!(each_document_field_hash[:choices][each_choice][:params], input_field_style_hash)
              new_document_field_hash[:class_name] = class_name_conversion[new_document_field_hash[:class_name].to_s] if class_name_conversion[new_document_field_hash[:class_name].to_s]
              one_input_document_field = true
              # new_document_field_hash[:input_type] = "text" if each_document_field_hash[:choices][each_choice][:params][:input_type]
            # Is there a input field and choice combination document_field?????
            # elsif !each_document_field_hash[:choices][each_choice][:selectChoices]
            #   new_document_field_choice = each_document_field_hash[:choices][each_choice][:params]
            #   new_document_field_choice.merge(select_and_button_choice_style_hash)
            elsif each_document_field_hash[:choices][each_choice][:selectChoices]
              # If select chioces
              new_document_field_hash.merge!(select_and_button_field_style_hash)
              new_select_choice_attributes = []
              new_document_field_choice = each_document_field_hash[:choices][each_choice][:params]

              each_document_field_hash[:choices][each_choice][:selectChoices].keys.each do |each_select_key|
                # puts 'Working on a each_document_field_hash each_choice, name, each_document_field_hash[:choices][each_choice][:selectChoices][each_select_key]: ' + name + ' ' + each_document_field_hash[:choices][each_choice][:selectChoices][each_select_key].to_s if each_document_field_hash[:sample]
                # push into array hash with relevant keys; Delete keys if not a key in select_choices_keys_hash
                new_select_choice_attributes.push(each_document_field_hash[:choices][each_choice][:selectChoices][each_select_key].delete_if { |k| !select_choices_keys_hash[k] })
              end # each_document_field_hash[:choices][each_choice][:selectChoices].keys.each do |each_select_key|
              new_document_field_choice.merge(select_and_button_choice_style_hash)
              new_document_field_choice[:select_choices_attributes] = new_select_choice_attributes
            end # if each_document_field_hash[:choices][each_choice][:selectChoices]

          else #if each_choice == :inputFieldValue
            # if choice buttons
            # puts 'In create_document_field_array, working on name, name, each_choice, each_document_field_hash[:choices][each_choice]: ' + name.to_s + " " + each_choice.to_s + " " + each_document_field_hash[:choices][each_choice].to_s if each_choice == :yes
            true_choice = each_choice == 0 || each_choice == true
            false_choice = each_choice == 1 || each_choice == false
            button_choice = true

            new_document_field_choice = each_document_field_hash[:choices][each_choice][:params]
            # Add key value according to type of field
            new_document_field_hash.merge!(select_and_button_field_style_hash) if !true_choice && !false_choice
            new_document_field_hash.merge!(true_false_button_field_style_hash) if (true_choice || false_choice)

            new_document_field_choice[:val] = 't' if true_choice
            new_document_field_choice[:val] = 'f' if false_choice
            new_document_field_choice[:class_name] = class_name_conversion[new_document_field_choice[:class_name].to_s] if class_name_conversion[new_document_field_choice[:class_name].to_s]

            new_document_field_choice.merge!(each_rectangle_button_field_style_hash) if !true_choice && !false_choice
            new_document_field_choice.merge!(each_true_false_circle_button_field_style_hash) if (true_choice || false_choice)
            # Adjust the top and left of each circle and rectangle choice
            button_element_dimension_adjustment_hash[:circle].keys.each {|key| new_document_field_choice[key] = "#{new_document_field_choice[key].to_f + button_element_dimension_adjustment_hash[:circle][key]}%"} if (true_choice || false_choice)
            button_element_dimension_adjustment_hash[:rectangle].keys.each {|key| new_document_field_choice[key] = "#{new_document_field_choice[key].to_f + button_element_dimension_adjustment_hash[:rectangle][key]}%"} if !true_choice && !false_choice
          end #if each_choice == :inputFieldValue
          # puts 'In create_document_field_array, working on name, name, each_choice, new_document_field_choice, new_document_field_hash: ' + name.to_s + " " + each_choice.to_s + " " + new_document_field_choice.to_s + " " + new_document_field_hash.to_s
          # puts 'In create_document_field_array, working on name, name, each_choice, new_document_field_choice left, top, width, height: ' + new_document_field_choice[:left].to_f.to_s + " " + new_document_field_choice[:top].to_f.to_s + " " + new_document_field_choice[:width].to_f.to_s + " " + new_document_field_choice[:height].to_f.to_s
          tally_document_field_dimensions.call({left: new_document_field_choice[:left].to_f,
                                                top: new_document_field_choice[:top].to_f,
                                                width: new_document_field_choice[:width].to_f,
                                                height: new_document_field_choice[:height].to_f
                                                }) if new_document_field_choice
          new_document_field_choices_array.push(new_document_field_choice) if new_document_field_choice

        end #each_document_field[:choices].keys.each do |each_choice|
        # puts 'In create_document_field_array, working on name, name, each_choice, new_document_field_choices_array, new_document_field_choices_array.length > 0, each_document_field_hash[:sample]: ' + name.to_s + " " + new_document_field_choices_array.to_s + ' ' +  (new_document_field_choices_array.length > 0).to_s + each_document_field_hash[:sample].to_s if each_document_field_hash[:sample]
        # document_field_dimensions.keys.each {|key| new_document_field_hash[key] = `#{document_field_dimensions[key]}%`}
        # Update document_field dimensions left, top, width and height tallied in tally_document_field_dimensions method
        document_field_dimensions.keys.each {|key| new_document_field_hash[key] = "#{document_field_dimensions[key].to_s}%"} if !one_input_document_field
        new_document_field_hash[:document_field_choices_attributes] = new_document_field_choices_array if new_document_field_choices_array.length > 0
        puts 'In create_document_field_array, working on name, name, each_choice, new_document_field_choices_array, each_document_field_hash[:sample]: ' + name.to_s + " " + each_document_field_hash.to_s + ' ' + each_document_field_hash[:sample].to_s if each_document_field_hash[:sample]
        # Place each document_field in array to be sent as params to agreements controller
        document_field_array.push(new_document_field_hash)
        # puts 'In create_document_field_array, working on name, document_field_array, each_document_field_hash[:sample]: ' + name.to_s + " " + document_field_array.to_s + ' ' + each_document_field_hash[:sample].to_s if each_document_field_hash[:sample]
        count += 1
      end # if sample or each_page == 1
      end #by_page_hash[each_page].each do |each_document_field|
    end # FixedTermRentalContractBilingualAllbyPage::OBJECT.keys.each do |each_page|
  end

  create_document_field_translation_array = lambda do |by_page_hash, document_type|

    by_page_hash.keys.each do |each_page|
      puts 'In create_document_field_translation_array, working on: ' + document_type + " " + each_page.to_s
      # puts 'In create_document_field_translation_array, by_page_hash: ' + by_page_hash.to_s

      by_page_hash[each_page].each do |each_document_field|
        # puts 'In create_document_field_translation_array, each_document_field: ' + each_document_field.to_s
        name = each_document_field[0].to_s
        each_document_field_hash = each_document_field[1]

          if each_page == 1 || each_page == 2
        # if each_document_field_hash[:sample]
          puts 'In create_document_field_translation_array, working on: ' + document_type + " " + each_page.to_s + " " + name.to_s + " " + each_document_field_hash.to_s
        new_document_field_hash = {
          name: name,
          class_name: "document-rectangle-template",
          page: each_page,
          border_color: "lightgray",
          translation_element: true,
          font_style: "normal",
          # font_weight: "bold",
          height: "1.6%",
          input_type: "text",
          transform: each_document_field_hash[:attributes][:rotate] ? each_document_field_hash[:attributes][:rotate] : 0,
          transform_origin: 'top left',
          width: "15%", # Default width; Some :attributes have width
        }

        # puts 'In create_document_field_translation_array, new_document_field_hash, each_document_field_hash: ' + new_document_field_hash.to_s + ' ' + each_document_field_hash.to_s
        new_document_field_hash.merge!(each_document_field_hash[:attributes]) if each_document_field_hash[:attributes]
        # Adijust the coodinate attributes of the hashes
        translation_input_adjustment_hash.keys.each {|key| new_document_field_hash[key] = "#{new_document_field_hash[key].to_f + translation_input_adjustment_hash[key]}%"}
        # Apply any other overrides on hash attributes
        new_document_field_hash.merge!(translation_input_override_hash) # override for properties in :attributes that ALL have to change

        # *************************SAVE*************************************
        # document_field_translations_array = []
        # # document_field_translations_attributes
        # each_document_field_hash[:translations].keys.each do |each_key|
        #   each_document_translation_hash = nil
        #   if each_document_field_hash[:translations][each_key]
        #     each_document_translation_hash = {}
        #     each_document_translation_hash[:language_code] = each_key
        #     each_document_translation_hash[:value] = each_document_field_hash[:translations][each_key]
        #     document_field_translations_array.push(each_document_translation_hash)
        #   end # if each_document_field_hash[:translations][each_key][:value]
        # end # each_document_field_hash[:translations].keys.each do |each_key|
        # new_document_field_hash[:document_field_translations_attributes] = document_field_translations_array if document_field_translations_array.length > 0
        # *************************SAVE*************************************
        document_field_array.push(new_document_field_hash)
        count += 1
      end # if sample or each_page == 1
      end # by_page_hash[each_page].each do |each_document_field|
    end # by_page_hash.keys.each do |each_page|
  end # create_document_field_translation_array = lambda do |by_page_hash, document_type|

# Main hashes to be sent to the agreements controller as agreement params
 documents_hash = {

   'Rental Agreement' => {
      by_page_hash: FixedTermRentalContractBilingualAllbyPage::OBJECT,
      by_page_hash_translation: DocumentTranslationFixedTermByPage::OBJECT,
      params_hash: {
        agreement: {
          booking_id: Booking.first.id,
          flat_id: nil,
          document_name: "Fixed Term Rental Standard Contract",
          language_code: "jp",
          language_code_1: "en",
          document_pages: 12,
          document_code: "own_uploaded_document",
          document_publicid: "apartmentpj-constant-assets/teishaku-saimuhosho-bilingual-v3-no-translation-12",
          template_file_name: "fixed_term_rental_contract_bilingual",
          document_type: "template",
          document_page_size: "595,841",
          standard_document: true,
        },
        # document_field to be assigned populated array before calling agreement controller method
        document_field: [],
      } # params_hash
   }, #'Rental Agreement'

   # 'Important Points' => {
   #   by_page_hash: ImportantPointsExplanationBilingualAllbyPage::OBJECT,
   #   by_page_hash_translation: DocumentTranslationImportantPointsByPage::OBJECT,
   #   params_hash: {
   #     agreement: {
   #       booking_id: Booking.first.id,
   #       flat_id: nil,
   #       document_name: "Important Points Standard Template",
   #       language_code: "jp",
   #       language_code_1: "en",
   #       document_pages: 11,
   #       document_code: "own_uploaded_document",
   #       document_publicid: "apartmentpj-constant-assets/juyoujikou-setsumei-bilingual-v3-no-translation-30",
   #       template_file_name: "important_points_explanation_bilingual",
   #       document_type: "template",
   #       document_page_size: "595,841",
   #     },
   #     # document_field to be assigned populated array before calling agreement controller method
   #     document_field: [],
   #   } #params_hash
   # } # 'Important Points' => {
 } # documents_hash = {

 document_count = 0
 # !!!!!! MAIN CODE !!!!!!!!!
 documents_hash.keys.each do |each_key|
   # Populate document_field_array with document_field including translation_element
   create_document_field_array.call(documents_hash[each_key][:by_page_hash], each_key)
   create_document_field_translation_array.call(documents_hash[each_key][:by_page_hash_translation], each_key)
   # puts 'In documents_hash.keys.each do |each_key|, document_field_array: ' + document_field_array.to_s
   # Reassign the populated document_field_array before calling controller method
   documents_hash[each_key][:params_hash][:document_field] = document_field_array
   # call agreement controller end point with params; Cannot call agreements#create from here for some reason but code reducndancy is minimal
   session.post "/api/v1/agreement_create", params: documents_hash[each_key][:params_hash]
   # Empty document_field_array when finished with each document
   document_field_array = []
   document_count += 1
   puts 'Prepared ' + document_count.to_s + ' document(s) and ' + count.to_s + ' ' + 'document fields to be created'
 end # documents_hash.keys.each do |each_key|
end
