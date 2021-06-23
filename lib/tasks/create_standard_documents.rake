desc 'Create Standard Documents, Rental and Important Points'
task :create_standard_documents  => :environment do
  Dir.glob("#{Rails.root}/app/models/*.rb").each { |file| require file }
 # Require the by page hashes
  require Dir.glob("#{Rails.root}/app/controllers/concerns/fixed_term_rental_contract_bilingual_all_by_page.rb")[0]
  require Dir.glob("#{Rails.root}/app/controllers/concerns/important_points_explanation_bilingual_all_by_page.rb")[0]
  require Dir.glob("#{Rails.root}/app/controllers/concerns/document_translation_fixed_term_by_page.rb")[0]
  require Dir.glob("#{Rails.root}/app/controllers/concerns/document_translation_important_points_by_page.rb")[0]
 # include FixedTermRentalContractBilingualAllbyPage
 # include ImportantPointsExplanationBilingualAllbyPage
  puts 'Creating standard documents...'
  session = ActionDispatch::Integration::Session.new(Rails.application)
  puts 'Creating standard documents...session: ' + session.to_s
 # ApplicationController.allow_forgery_protection = false
 # # app.post('/sign_in', {"user"=>{"login"=>"login", "password"=>"password"}})
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
    border: '1px solid black',
    border_color: "lightgray",
    input_type: "string",
    font_family: "arial",
    font_weight: "normal",
    transform_origin: 'top left',
  }
  # select_choice_style_hash for document_field_choice with
  select_choice_style_hash = {
    # width: '10%',
    class_name: 'document-rectangle-template',
    height: '2.0%',
    # width: '12%',
    font_style: "normal",
    font_size: "12px",
    border: '1px solid black',
    border_color: "lightgray",
    input_type: "string",
    font_family: "arial",
    font_weight: "normal",
    transform_origin: 'top left',
  }

  select_choices_keys_hash = {
    :value => true,
    :val => true
    # end of select_choices_attributes
  }
  # select_choices_keys_array = [
  #   :value,
  #   :val
  # ]
    # end of select_choices_attributes


  # button_field_style_hash = {
  #   border_color: "lightgray",
  #   class_name: "document-rectangle-template",
  #   transform_origin: 'top left',
  #   transform: nil
  # }

  each_rectangle_button_field_style_hash = {
    # border_radius: '50%',
    border: "1px solid black",
    class_name: 'document-rectangle-template-button',
    height: '2.0%',
    font_size: '12px',
    # class_name: "document-rectangle-template",
    # class_name: "document-circle-template",
  }

  each_true_false_circle_button_field_style_hash = {
    border_radius: '50%',
    border: "1px solid black",
    height: '1.6%',
    # class_name: 'document-rectangle-template-button',
    # class_name: "document-rectangle-template",
    class_name: "document-circle-template",
  }

  document_field_array = []
  count = 0

  create_document_field_array = lambda do |by_page_hash, document_type|

    by_page_hash.keys.each do |each_page|
      puts 'In create_document_field_array, working on: ' + document_type + " " + each_page.to_s
      by_page_hash[each_page].each do |each_document_field|
        # each_document_field is somehow an array
        name = each_document_field[0].to_s
        name.slice!("_1") if name.include?("_1")
        name.slice!("_2") if name.include?("_2")
        name.slice!("_3") if name.include?("_3")
        name.slice!("_4") if name.include?("_4")
        # puts 'In create_document_field_array, working on name, name.class: ' + name.to_s + " " + name.class.to_s

        each_document_field_hash = each_document_field[1]
        # puts 'Working on a document field array, name, each_document_field_hash[:choices].keys: ' + name.to_s + each_document_field_hash[:choices].keys.to_s
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
        #
        new_document_field_choices_attributes = []
        new_document_field_translations_attributes = []
        new_document_field_choices = []

        each_document_field_hash[:choices].keys.each do |each_choice|
          # start new_document_field_choice with nil so can push into array if populated later
          new_document_field_choice = nil
          # if choice is an input field or a select choice
          if each_choice.to_s == "inputFieldValue" || each_choice.to_s == "documentAttributes"
            # If not select choices
            if !each_document_field_hash[:choices][each_choice][:selectChoices] && each_document_field_hash[:choices].keys.length == 1
              # Merge the params with the new_document_field_hash
              new_document_field_hash.merge!(each_document_field_hash[:choices][each_choice][:params], input_field_style_hash)
              new_document_field_hash[:class_name] = class_name_conversion[new_document_field_hash[:class_name].to_s] if class_name_conversion[new_document_field_hash[:class_name].to_s]
              # new_document_field_hash[:input_type] = "text" if each_document_field_hash[:choices][each_choice][:params][:input_type]

            elsif each_document_field_hash[:choices][each_choice][:selectChoices]
              # If select chioces
              new_document_field_hash.merge!(select_and_button_field_style_hash)
              new_select_choice_attributes = []
              new_document_field_choice = each_document_field_hash[:choices][each_choice][:params]

              each_document_field_hash[:choices][each_choice][:selectChoices].keys.each do |each_select_key|
                # puts 'Working on a each_document_field_hash each_choice, name, each_document_field_hash[:choices][each_choice][:selectChoices][each_select_key]: ' + name + ' ' + each_document_field_hash[:choices][each_choice][:selectChoices][each_select_key].to_s if each_document_field_hash[:sample]
                # push into array hash with relevant keys; Delete keys if not a key in select_choices_keys_hash
                new_select_choice_attributes.push(each_document_field_hash[:choices][each_choice][:selectChoices][each_select_key].delete_if { |k| !select_choices_keys_hash[k] })
              end #  each_document_field_hash[:choices][each_choice][:selectChoices].keys.each do |each_select_key|
              # document_field =
              new_document_field_choice.merge(select_choice_style_hash)
              new_document_field_choice[:select_choice_attributes] = new_select_choice_attributes
            # else
            end # if each_document_field_hash[:choices][each_choice][:selectChoices]

          else #if each_choice == :inputFieldValue
            # if choice buttons
            # puts 'In create_document_field_array, working on name, name, each_choice, each_document_field_hash[:choices][each_choice]: ' + name.to_s + " " + each_choice.to_s + " " + each_document_field_hash[:choices][each_choice].to_s if each_choice == :yes
            # puts 'In create_document_field_array, working on name, name, each_choice, each_document_field_hash[:choices][each_choice]: ' + name.to_s + " " + each_choice.to_s + " " + each_document_field_hash[:choices][each_choice].to_s
            new_document_field_hash.merge!(select_and_button_field_style_hash)
            new_document_field_choice = each_document_field_hash[:choices][each_choice][:params]

            true_choice = each_choice == 0 || each_choice == true
            false_choice = each_choice == 1 || each_choice == false

            new_document_field_choice[:val] = 't' if true_choice
            new_document_field_choice[:val] = 'f' if false_choice
            new_document_field_choice[:class_name] = class_name_conversion[new_document_field_choice[:class_name].to_s] if class_name_conversion[new_document_field_choice[:class_name].to_s]

            new_document_field_choice.merge!(each_rectangle_button_field_style_hash) if !true_choice && !false_choice
            new_document_field_choice.merge!(each_true_false_circle_button_field_style_hash) if (true_choice || false_choice)
            # puts 'In create_document_field_array, working on name, name, each_choice, new_document_field_choice: ' + name.to_s + " " + each_choice.to_s + " " + new_document_field_choice.to_s if each_choice == :yes
          end #if each_choice == :inputFieldValue

          new_document_field_choices.push(new_document_field_choice) if new_document_field_choice
          puts 'In create_document_field_array, working on name, name, each_choice, new_document_field_choice, each_document_field_hash[:sample]: ' + name.to_s + " " + each_choice.to_s + " " + new_document_field_choice.to_s + " " + new_document_field_choices.to_s + ' ' +  each_document_field_hash[:sample].to_s if name == 'foundation'

        end #each_document_field[:choices].keys.each do |each_choice|

        new_document_field_hash[:document_field_choices_attributes] = new_document_field_choices if new_document_field_choices.length > 0
        # document_field_array.push(new_document_field_hash) if each_document_field_hash[:sample]
        document_field_array.push(new_document_field_hash) if each_document_field_hash[:sample]
        count += 1 if each_document_field_hash[:sample]
        # puts 'In create_document_field_array, working on name, name, new_document_fields, new_document_field_hash: ' + name.to_s + " " + new_document_fields.to_s + " " + new_document_field_hash.to_s + " "
        # document_field_array.push(new_document_field_hash)
        # puts 'Working on a document field array, new_document_field_hash: ' + new_document_field_hash.to_s
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

        new_document_field_hash = {
          name: name,
          # name: each_document_field_hash[:name],
          # input_type: each_document_field_hash[:input_type],
          class_name: each_document_field_hash[:class_name],
          # component: each_document_field_hash[:component],
          # value: nil,
          page: each_page,
          translation_element: true
        }

        # puts 'In create_document_field_translation_array, each_document_field_hash, each_document_field: ' + name + ' '+ each_document_field_hash.to_s + ' ********************* ' + each_document_field.to_s
        # puts 'In create_document_field_translation_array, new_document_field_hash, each_document_field_hash: ' + new_document_field_hash.to_s + ' ' + each_document_field_hash.to_s
        # puts 'In create_document_field_translation_array, name: ' + name.to_s
        new_document_field_hash.merge!(each_document_field_hash[:attributes]) if each_document_field_hash[:attributes]
        # puts 'In create_document_field_translation_array, name, new_document_field_hash: ' + name.to_s + ' ' + new_document_field_hash.to_s
        document_field_array.push(new_document_field_hash)
        count += 1
      end # by_page_hash[each_page].each do |each_document_field|
    end # by_page_hash.keys.each do |each_page|
  end # create_document_field_translation_array = lambda do |by_page_hash, document_type|



   documents_hash = {

     'Rental Agreement' => {
        by_page_hash: FixedTermRentalContractBilingualAllbyPage::OBJECT,
        by_page_hash_translation: DocumentTranslationFixedTermByPage::OBJECT,
        params_hash: {
          booking_id: Booking.first.id,
          flat_id: nil,
          document_name: "Fixed Term Rental Standard Contract",
          document_field: document_field_array,
          language_code: "jp",
          language_code_1: "en",
          document_pages: 12,
          document_code: "own_uploaded_document",
          document_publicid: "apartmentpj-constant-assets/teishaku-saimuhosho-bilingual-v3-no-translation-11",
          template_file_name: "fixed_term_rental_contract_bilingual",
          document_type: "template",
          document_page_size: "595,841",
        } # params_hash
     }, #'Rental Agreement'

     'Important Points' => {
       by_page_hash: ImportantPointsExplanationBilingualAllbyPage::OBJECT,
       by_page_hash_translation: DocumentTranslationImportantPointsByPage::OBJECT,
       params_hash: {
         booking_id: Booking.first.id,
         flat_id: nil,
         document_name: "Important Points Standard Template",
         document_field: document_field_array,
         language_code: "jp",
         language_code_1: "en",
         document_pages: 11,
         document_code: "own_uploaded_document",
         document_publicid: "apartmentpj-constant-assets/juyoujikou-setsumei-bilingual-v3-no-translation-30",
         template_file_name: "important_points_explanation_bilingual",
         document_type: "template",
         document_page_size: "595,841",
       } #params_hash
     } # 'Important Points' => {
   } # documents_hash = {
   document_count = 0

   documents_hash.keys.each do |each_key|
     # Populate document_field_array with document_field including translation_element
     create_document_field_array.call(documents_hash[each_key][:by_page_hash], each_key)
     # create_document_field_translation_array.call(documents_hash[each_key][:by_page_hash_translation], each_key)
     session.post "/api/v1/test_agreement", params: documents_hash[each_key][:params_hash]
     # Empty document_field_array when finished with one document
     document_field_array = []
     document_count += 1
     puts 'Prepared ' + document_count.to_s + ' document(s) and ' + count.to_s + ' ' + 'document fields to be created'
   end

   # session.post "/api/v1/agreements", params: params_hash



   # session.post "/api/v1/test_agreement", params: params_hash
   # session.post "/api/v1/agreements", params: params_hash
   # rental_agreement = Agreement.new
   # rental_agreement.booking_id = Booking.first.id
   #
   # if rental_agreement.save
   #   puts 'Outputting Rental Contract: ' + rental_agreement.to_s
   #
   #   by_page_hash = FixedTermRentalContractBilingualAllbyPage::OBJECT
   #
   #
   #   by_page_hash_translation = FixedTermRentalContractBilingualAllbyPage::OBJECT
   #   by_page_hash_translation.keys.each do |each_page|
   #     puts 'Working on Rental Contract Translation page: ' + each_page.to_s
   #   end # FixedTermRentalContractBilingualAllbyPage::OBJECT.keys.each do |each_page|
   # end # if rental_agreement.save
   #
   # important_points = Agreement.new
   # important_points.booking_id = Booking.first.id
   # important_points.document_publicid = "juyoujikou-setsumei-bilingual-v3-no-translation-30"
   # important_points.document_name = "Important Points Standard Template"
   # important_points.language_code = "jp"
   # important_points.language_code_1 = "en"
   # important_points.template_file_name = "important_points_explanation_bilingual"
   # important_points.document_code: "own_uploaded_document"
   # important_points.document_pages = 11
   # important_points.document_type = "template"
   # important_points.document_page_size = nil
   #
   # if important_points.save
   #   puts 'Outputting Important Points: ' + important_points.to_s
   #
   #   ImportantPointsExplanationBilingualAllbyPage::OBJECT.keys.each do |each_page|
   #     puts 'Working on Important Points page: ' + each_page.to_s
   #   end # ImportantPointsExplanationBilingualAllbyPage::OBJECT.keys.each do |each_page|
   #   DocumentTranslationImportantPointsByPage::OBJECT.keys.each do |each_page|
   #     puts 'Working on Important Points page: ' + each_page.to_s
   #   end # ImportantPointsExplanationBilingualAllbyPage::OBJECT.keys.each do |each_page|
   # end # if important_points_explanation.save
   #
   # puts 'Finished Creating standard documents...'
end
