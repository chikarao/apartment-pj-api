class Api::V1::AgreementsController < ApplicationController
  # include DocumentTranslationImportantPoints
  # include DocumentTranslationFixedTerm
  include ContractTranslationMapObject
  include CreatePdf
  include TemplateElementFunctions
  include Progress
  # before_action :load_flat, only: [:destroy, :show, :create, :update]
  before_action :load_agreement, only: [:destroy, :show, :update]
  before_action :valid_token, only: [:destroy, :show, :create, :update, :save_template_agreement_fields, :fetch_user_agreements, :add_existing_agreements, :fetch_document_fields_for_page]

  def show
    if @agreement
      agreement_serializer = parse_json @agreement
      document_inserts_serializer = parse_json @agreement.document_inserts
      json_response "Showed agreement succesfully", true, {document_inserts: document_inserts_serializer, agreement: agreement_serializer}, :ok
    else
      json_response "Show agreement failed", false, {}, :unprocessable_entity
    end
  end
  #
  # def new
  # end

  def create
    p "In agreement, agreement#create, agreement_params: " + agreement_params.to_s

    agreement = Agreement.new agreement_params
    agreement.created_at = DateTime.now
    # start result with true; if cloudinary upload fails, turns false
    # If #create called from rake, no need for image upload
    result = true
    # create recieves a multipart/form-data object which rails wraps with dispatchaction object
    if !params[:file].blank?
      uploaded_io = params[:file]
      path = Rails.root.join("public/system/temp_files/images", uploaded_io.original_filename)
      # open file for writing in binary
      File.open(path, 'wb') do |file|
        file.write(uploaded_io.read)
      end

      image = File.open(path)
      result = Cloudinary::Uploader.upload(image, options = {})
      if result
        agreement.document_publicid = result["public_id"]
        agreement.document_pages = result["pages"]
        width = result["width"]
        height = result["height"]
        agreement.document_page_size = "#{width},#{height}"
      else
        json_response "Create agreement failed because the pdf upload failed.", false, {}, :unprocessable_entity
        File.delete(path) if path
      end
    end
    # just_document_keys_array = create_document_keys_array(params)
    # only if have parent
    # agreement.book_id = params[:book_id]
    # p "document_field_params.document_field.count: " + document_field_params["document_field"].count.to_s
    if result && agreement.save
      document_field_params["document_field"].each do |each|
        document_field_instance = DocumentField.new(each)
        document_field_instance.agreement_id = agreement.id

        if document_field_instance.save
          # return
        else
          agreement.destroy
          break
          # json_response "Create agreement failed", false, {}, :unprocessable_entity
        end # end of if document_field_instance
      end # End of each document_field
      booking = Booking.find_by(id: agreement_params[:booking_id])
      booking_serializer = parse_json booking
      agreement_serializer = parse_json agreement
      json_response "Created agreement succesfully", true, {agreement: agreement_serializer, booking: booking_serializer}, :ok
      File.delete(path) if path
    else
      json_response "Create agreement failed", false, {}, :unprocessable_entity
      File.delete(path) if path
    end
  end

  # def edit
  # end

  def save_template_agreement_fields
    #send_progress_percentage in concerns/progress.rb
    send_progress_percentage({user_id: @user.id, percentage: 10, time: Time.now, message: 'Received request'}) if params[:save_and_create]
    # This endpoint creates new fields and updates existing template fields
    # p "save_template_agreement_fields, document_field_params, document_field_choice_params, params[:booking_id], params[:agreement_id]: " + document_field_params.to_s + ' ' + document_field_choice_params.to_s + ' ' + params[:booking_id].to_s + + ' ' + params[:agreement_id].to_s
    booking = Booking.find_by(id: params[:booking_id])
    agreement = Agreement.find_by(id: params[:agreement_id])
    document_field_params["document_field"].each do |each|
      # If id includes character 'a' it is a new field, so create new
      if each["id"].is_a?(String) && (each["id"].include?('a') || each["id"].include?('b'))
        # IMPORTANT: .new enables nested document_field_choices to be created
        # See document_field model for accepts_nested_attributes_for method
        # document_field params needs to be document_fields_attributes for nesting to work
        document_field = DocumentField.new(each.except(:id))
        document_field.agreement_id = agreement.id
        unless document_field.save
          json_response "Save new template agreement fields failed", false, {}, :unprocessable_entity
          break
        end # end of unless document_field.save
      else # if doesn't include 'a' it is an existing field in DB, so update
        document_field = DocumentField.find_by(id: each["id"])
        # IMPORTANT: .update enables nested document_field_choices to be created
        # See document_field model for accepts_nested_attributes_for method
        # document_field params needs to be document_fields_attributes for nesting to work
        unless document_field.update(each)
          json_response "Save existing template agreement fields failed", false, {}, :unprocessable_entity
          break
        end #end of unless
      end #end of if include
    end # end of each

    # If there are ids in the deleted_document_field array, delete document_fields
    if params["deleted_document_field_id_array"].length > 0
      params["deleted_document_field_id_array"].each do |each|
        document_field = DocumentField.find_by(id: each)
        if document_field
          unless document_field.destroy
            json_response "Save existing template agreement fields failed", false, {}, :unprocessable_entity
            break
          end
        end
      end #end of deleted each
    end #end of deleted lengh > 0
    # If there are hash objects with document_field_id and document_field_translation ids
    if params["deleted_document_field_translations_array"].length > 0
      params["deleted_document_field_translations_array"].each do |each|
        # each is a hash object with { document_field_id: 1, document_field_translation_id: 1}
        document_field_translation = DocumentFieldTranslation.find_by(id: each.to_i)
        if document_field_translation
          unless document_field_translation.destroy
            json_response "Save existing template agreement fields failed", false, {}, :unprocessable_entity
            break
          end
        end
      end #end of deleted each
    end #end of deleted lengh > 0
    # p "!!!!! agreement_controller TemplateElementFunctions, get_simplified_template_field_object, paramsparams[:save_and_create]: " + params.to_s + params[:save_and_create].to_s

    if params[:save_and_create]
      send_progress_percentage({user_id: @user.id, percentage: 20, time: Time.now, message: 'Updated fields'})
      document_fields = DocumentField.where(agreement_id: agreement.id)
      document_insert = params[:use_main_document_insert] ? DocumentInsert.where(agreement_id: agreement.id) : []
      # document_fields = agreement.document_fields
      # Need to get document fields simplified so that they have one object and no children objects (no document_field_choices nor document_field_translations)
      # template_document_fields is a hash with mapped objects document_fields and translation
      template_document_fields = get_simplified_template_field_object(document_fields, agreement, params[:document_language_code])
      send_progress_percentage({user_id: @user.id, percentage: 30, time: Time.now, message: 'Preparing for PDF creation'})
      document_language_code = params[:document_language_code]
      # create_pdf called for static elements:
      # cloudinary_result = create_pdf(document_fields, contract_name, params[:save_and_create], translation, document_language_code, document_insert_main, agreement, template_document_fields)
      cloudinary_result = create_pdf([], nil, params[:save_and_create], {}, document_language_code, document_insert[0], agreement, template_document_fields)
      send_progress_percentage({user_id: @user.id, percentage: 70, time: Time.now, message: 'Created PDF'})
      # p "!!!!! agreement_controller after get_simplified_template_field_object, cloudinary_result: " + cloudinary_result.to_s
      # Destroy existing pdf if it exists
      unless !agreement.document_publicid
        send_progress_percentage({user_id: @user.id, percentage: 70, time: Time.now, message: 'Deleting old PDF'})
        result = Cloudinary::Uploader.destroy(agreement.document_pdf_publicid);
      end
      # Assign new pdf publicid
      # (Note: document_pdf_publicid is different from document_publicid which is for the background of the agreement)
      agreement.document_pdf_publicid = cloudinary_result["public_id"]
      agreement.document_pdf_pages = cloudinary_result["pages"]
      send_progress_percentage({user_id: @user.id, percentage: 80, time: Time.now, message: 'Saving records'})

      unless agreement.save
        json_response "Update agreement but create PDF failed", false, {}, :unprocessable_entity
        # break
      end
    end

    # IMPORTANT: agreement serializer and document_field_serializer have a custom document_field
    # and document_field_choice serializer that returns document_field_choices
    # Rails default depth of child ssociations is one, so use custom to get another layer
    agreements = Agreement.where(booking_id: params[:booking_id])
    document_fields = agreement.document_fields
    # agreement_serializer = parse_json agreement
    agreement_serializer = parse_json agreements
    document_field_serializer = parse_json document_fields
    booking_serializer = parse_json booking
    send_progress_percentage({user_id: @user.id, percentage: 100, time: Time.now, message: 'Returning'}) if params[:save_and_create]
    # if none of the above each loops do not break, send successful json response
    if !booking # if save came from editFlat
      flat = Flat.find_by(id: agreement.flat_id)
      flat_serializer = parse_json flat
      json_response "Saved template agreement fields successfully", true, {flat: flat_serializer, agreements: agreement_serializer, document_fields: document_field_serializer, booking: nil}, :ok
    else
      json_response "Saved template agreement fields successfully", true, {agreements: agreement_serializer, document_fields: document_field_serializer, booking: booking_serializer}, :ok
    end
  end

  def update_agreement_fields
    booking = Booking.find_by(id: params[:booking_id])
    agreement = Agreement.find_by(id: params[:agreement_id])
    # update each document field sent in document_field_params
    document_field_params[:document_field].each do |each|
      # p "each: " + each.to_s
      # find each document field an udpate
      document_field = DocumentField.find_by(id: each[:id])
      # if any document_field fails to update, break and send fail message
      unless document_field.update(each)
        json_response "Update agreement fields failed", false, {}, :unprocessable_entity
        break
      end
    end # end of each

    # if save_and_create: true sent in params
    if params[:save_and_create]
      # document_field = DocumentField.find_by(id: document_field_params["document_field"][0][:id])
      agreement = Agreement.find_by(id: params[:agreement_id])
      document_fields = DocumentField.where(agreement_id: agreement.id)
      document_language_code = params[:document_language_code]
      #!!!!!! Cloudinary file names NEED to be change each time a new file is uploaded as a template to Cloudinary
      contract_translation_map_object = ContractTranslationMapObject::OBJECT
      # p "!!!!!ContractTranslationMapObject::OBJECT: " + ContractTranslationMapObject::OBJECT.to_s
      # contract_translation_map_object =
      #   {
      #     "teishaku-saimuhosho" => {},
      #     "juyoujikou-setsumei-jp" => {},
      #     # "teishaku-saimuhosho-bilingual-v3-no-translation-8" => fixed_term_rental_contract_translation,
      #     "teishaku-saimuhosho-bilingual-v3-no-translation-9" => DocumentTranslationFixedTerm::OBJECT,
      #     # "juyoujikou-setsumei-bilingual-v3-no-translation-26" => important_points_explanation_translation
      #     "juyoujikou-setsumei-bilingual-v3-no-translation-26" => DocumentTranslationImportantPoints::OBJECT
      #   }
      contract_name = params[:template_file_name]
      translation = contract_translation_map_object[contract_name]
      if params[:use_own_main_agreement]
        document_insert_main = DocumentInsert.find_by(agreement_id: agreement.id, main_agreement: true)
      else
        document_insert_main = nil;
      end
      # p "!!!!! contract_name, translation, fixed_term_rental_contract_translation " + contract_name.to_s + " " + translation.to_s + " " + fixed_term_rental_contract_translation.to_s
      cloudinary_result = create_pdf(document_fields, contract_name, params[:save_and_create], translation, document_language_code, document_insert_main, agreement, nil)
      # p "after cloudinary create, cloudinary_result[public_id]: " + cloudinary_result["public_id"].to_s
      # p "cloudinary_result, cloudinary_result.class: " + cloudinary_result.to_s + " " + cloudinary_result.class.to_s
      unless !agreement.document_pdf_publicid
        result = Cloudinary::Uploader.destroy(agreement.document_pdf_publicid);
        # p "after cloudinary destroy result, params[:save_and_create]: " + result.to_s + params[:save_and_create].to_s
      end
      agreement.document_pdf_publicid = cloudinary_result["public_id"]
      agreement.document_pages = cloudinary_result["pages"]

      unless agreement.save
        json_response "Update agreement but create PDF failed", false, {}, :unprocessable_entity
        # break
      end
    end

    if agreement.document_name != params[:document_name]
      agreement.document_name = params[:document_name]
      unless agreement.save
        json_response "Update agreement fields failed", false, {}, :unprocessable_entity
        # break
      end
    end

    agreement_serializer = parse_json agreement
    booking_serializer = parse_json booking
    unless params[:save_and_create]
      json_response "Updated agreement fields succesfully", true, {agreement: agreement_serializer, booking: booking_serializer}, :ok
    else
      json_response "Updated agreement fields and created PDF succesfully", true, {agreement: agreement_serializer, booking: booking_serializer }, :ok
    end
  end

  def update
    result = {}
    image_to_destroy = @agreement.document_publicid
    image_upload_ok = true

    if !params[:file].blank?
      result = upload_image(params[:file])
      if result
        @agreement.document_publicid = result["public_id"]
        @agreement.document_pages = result["pages"]
        width = result["width"]
        height = result["height"]
        @agreement.document_page_size = "#{width},#{height}"

        # Check if image pages is less than the last page with document_field
        # Otherwise, there will be a breaking error if document_field cannot be rendered
        # document_fields = @agreement.document_fields
        # if document_fields.length > 0
        #   last_page_with_document_field = 0
        #   document_fields.each do |each_document_field|
        #     last_page_with_document_field = each_document_field.page if each_document_field.page > last_page_with_document_field
        #   end
        #   image_upload_ok = false if last_page_with_document_field > @agreement.document_pages
        # end #  if document_fields.length > 0

      else
        image_upload_ok = false
        json_response "Edit agreement failed because the pdf upload failed.", false, {}, :unprocessable_entity
        # File.delete(path) if path
      end
    end

    if image_upload_ok && @agreement.update(agreement_params)
      booking = Booking.find_by(id: agreement_params[:booking_id])
      if @agreement.document_publicid != image_to_destroy
        result = Cloudinary::Uploader.destroy(image_to_destroy);
      end
      booking_serializer = parse_json booking
      # flat = Flat.find_by(id: params[:flat_id])
      agreement_serializer = parse_json @agreement
      # Send back flat if agreement update sent from edit flat in front end
      flat_serializer = nil
      if @agreement.flat_id && params[:edit_flat]
        flat = Flat.find_by(id: @agreement.flat_id)
        flat_serializer = parse_json flat
      end
      # agreement_serializer = parse_json @agreement
      json_response "Updated agreement succesfully", true, {agreement: agreement_serializer, booking: booking_serializer, flat: flat_serializer}, :ok
    else
      json_response "Update agreement failed", false, {}, :unprocessable_entity
    end
  end

  def destroy
    booking = Booking.find_by(id: @agreement.booking_id)
    image_to_destroy_array = [@agreement.document_publicid]
    if @agreement.document_inserts.length > 0
      @agreement.document_inserts.each do |each|
        image_to_destroy_array.push(each.publicid)
      end
    end

    if @agreement.destroy
      # check if image_to_destroy = null in case no pdf create yet
      unless !image_to_destroy_array[0]
        image_to_destroy_array.each do |each_publicid|
          result = Cloudinary::Uploader.destroy(each_publicid);
        end
      end
      booking_serializer = parse_json booking
      # agreement_serializer = parse_json @agreement
      json_response "Deleted agreement succesfully", true, {booking: booking_serializer}, :ok
    else
      json_response "Delete agreement failed", false, {}, :unprocessable_entity
    end
  end

  def fetch_user_agreements
    p "In agreement, fetch_user_agreements @user.id: " + @user.id.to_s
    # array_of_results_arrays = []
    # flat_agreements = Agreement.for_user_flat(@user.id)
    # booking_agreements = Agreement.for_bookings_for_user_flat(@user.id)
    agreements_objects = get_user_agreements_objects()

    # all_user_agreements_mapped
    # user_flats.each { |each| mapped_user_flats[each.id] = parse_json each }
    # flat_agreements_serializer = parse_json flat_agreements
    # booking_agreements_serializer = parse_json booking_agreements

    json_response "Fetched user agreements succesfully", true, {
      # flat_agreements: mapped_flat_agreements,
      user_bookings: agreements_objects[:mapped_user_bookings],
      user_flats: agreements_objects[:mapped_user_flats],
      all_user_agreements_mapped: agreements_objects[:all_user_agreements_mapped],
      user_agreements_array_sorted: agreements_objects[:user_agreements_serializer]
      }, :ok
  end

  def agreement_create
    count = 0
    agreement = Agreement.new agreement_params
    # p "In agreements, agreement_create, agreement_params: " + agreement_params.to_s
    # p "In agreements, agreement_create, document_field_params: " + document_field_params.to_s
    p "In agreements, agreement_create, new agreement, agreement.booking_id: " + agreement.to_s + ' ' + agreement["booking_id"].to_s
    if agreement.save
      count += 1
      document_field_params["document_field"].each do |each|
        document_field_instance = DocumentField.new(each)
        document_field_instance.agreement_id = agreement.id

        unless document_field_instance.save
          # return
          agreement.destroy
          count = 0
          break
          # json_response "Create agreement failed", false, {}, :unprocessable_entity
        end # end of if document_field_instance
      end # End of each document_field
      # Persist document_fields for standard document in redis
      # second parameter is in seconds; If 0, DO NOT set expiration on redis key
      # third parameter indicates call from standard documents, so do not set expiration
      persist_document_fields_in_cache(agreement, 0)
    end # if agreement.save

    p "In agreements, agreement_create " + count.to_s + ' agreement(s) created.'
  end # def test_agreement

  def add_existing_agreements
    # add_existing_agreements called from editFlat and boookingConfirmation on front end
    # Receives agreement ids and returns flat with duplicated agreemnts to be assigned with params[:flat_id]
    # Defined hashes to be used in go_through_each_has_many_relation lambda
    document_field_translations_hash = {relation_key: :document_field_translations, has_many_relations: [], belongs_to_id: :document_field_id}
    select_choices_hash = {relation_key: :select_choices, has_many_relations: [], belongs_to_id: :document_field_choice_id}
    document_field_choices_hash = {relation_key: :document_field_choices, has_many_relations: [select_choices_hash], belongs_to_id: :document_field_id}
    document_fields_hash = {relation_key: :document_fields, has_many_relations: [document_field_translations_hash, document_field_choices_hash], belongs_to_id: :agreement_id, keep_original_value: true}
    # agreement_hash = {relation_key: :agreements, has_many_relations: [document_fields_hash], belongs_to_id: :flat_id, relation_model: Agreement}

    # lambda method to get dups, save if not childrend, and go through child relations if they exist
    go_through_each_has_many_relation = lambda do |each_relation_object, dup_belongs_to_parent, top_dup_agreement_instance, original_belongs_to_existing_instance|
      # get array of has_many instances e.g. original agreement has array of document_fields
      array_of_original_has_many = original_belongs_to_existing_instance.association(each_relation_object[:relation_key]).association_scope
      # iterate through each; e.g. array of document_fields if at agrement layer
      array_of_original_has_many.each do |each_original_has_many|
        # create a duplicate and assign the parent id; e.g. document_field gets duplicate agreement.id
        dup_each_has_many = each_original_has_many.dup
        dup_each_has_many[each_relation_object[:belongs_to_id]] = dup_belongs_to_parent.id
        # if keep_original_value true, assign value to original value (only in document_field)
        dup_each_has_many[:original_value] = each_original_has_many[:value] if each_relation_object[:keep_original_value]
        dup_each_has_many[:value] = nil if each_relation_object[:keep_original_value]
        # if e.g. document_field has any has_many relations and is saved, iterate through each has_many relations
        # recursively complete all layers
        if each_relation_object[:has_many_relations].length > 0 && dup_each_has_many.save
          each_relation_object[:has_many_relations].each do |each_hash|
            go_through_each_has_many_relation.call(each_hash, dup_each_has_many, top_dup_agreement_instance, each_original_has_many)
          end # each_relation_object[:has_many_relations].each do |each_hash|
        else #if each_relation_object[:has_many_relations].length > 0
          unless dup_each_has_many.save
            # top_dup_agreement_instance.destroy
            # if anything does not save, delete all dup_agreements
            contingent_delete_dup_agreements_array.each do |each|
              each.destroy
            end #contingent_delete_dup_agreements_array.each do |each|
            json_response "Add agreement failed", false, {}, :unprocessable_entity
          end # unless dup_each_has_many.save
        end # if each_relation_object[:has_many_relations].length > 0
      end #array_of_original_has_many.each do |each_original_has_many|
    end #go_through_each_has_many_relation = lambda do

    agreement_has_many_array = [document_fields_hash]
    contingent_delete_dup_agreements_array = []
    # BASIC WORKINGS:
    # 1. The frontend sends an array of agreement ids through which this method iterates
    # 2. agreement.dup creates a shallow copy of each agreement which is assigned a flat_id or booking_id
    # depending on where the request is sent (edit flat or from booking confirmation)
    # If agreeement is saved, the iterator sends a recursive call of go_through_each_has_many_relation
    # go_through_each_has_many_relation lambda gets an array of has_many relation instances
    # duplicates (.dup) of each has_many and assigns ids of belongs_to parents
    # i.e. document_field gets agreement_id or agreement.id; document_field_translations gets document_field.id and so on
    # params[:agreement_id_hash] has agreement ids as keys and new document_name as values
    params[:agreement_id_hash].keys.each do |each_id|
      agreement = Agreement.find_by(id: each_id)
      dup_agreement = agreement.dup
      dup_agreement.flat_id = params[:edit_flat] ? params[:flat_id] : nil
      dup_agreement.booking_id = params[:edit_flat] ? nil : params[:booking_id]
      dup_agreement.document_name = params[:agreement_id_hash][each_id]

      if dup_agreement.save
        contingent_delete_dup_agreements_array.push(dup_agreement)
        agreement_has_many_array.each do |each_has_many_relations_hash|
          #   go_through_each_has_many_relation(each_relation, dup_agreement, dup_agreement)
          go_through_each_has_many_relation.call(each_has_many_relations_hash, dup_agreement, dup_agreement, agreement)
        end # end of agreement_has_many_array.each do |each|
      else #if dup_agreement.save
        # dup_agreement.destroy
        contingent_delete_dup_agreements_array.each do |each|
          each.destroy
        end #contingent_delete_dup_agreements_array.each do |each|
        json_response "Add agreement failed", false, {}, :unprocessable_entity
      end #if dup_agreement.save
    end #params[:agreement_id_hash].keys.each do |each_id|

    # get flat for selectedFlatFromParams
    flat_serializer = nil
    if params[:flat_id]
      flat = Flat.find_by(id: params[:flat_id])
      flat_serializer = parse_json flat
    end

    if params[:booking_id]
      booking = Booking.find_by(id: params[:booking_id])
      booking_serializer = parse_json booking
    end

    # agreements_objects = get_user_agreements_objects()
    # agreements = Agreement.where(flat_id: flat.id)
    # agreements_serializer = parse_json agreements

    json_response "Added existing agreements succesfully", true, {
      flat: flat_serializer,
      booking: booking_serializer,
      # flat_agreements: mapped_flat_agreements,
      # user_bookings: agreements_objects[:mapped_user_bookings],
      # user_flats: agreements_objects[:mapped_user_flats],
      # all_user_agreements_mapped: agreements_objects[:all_user_agreements_mapped],
      # user_agreements_array_sorted: agreements_objects[:user_agreements_serializer]
    }, :ok
  end

  def fetch_document_fields_for_page
    p "In agreements, fetch_document_fields_for_page, params: " + params.to_s

      cached_document_fields = $redis.hget("agreement:#{params[:agreement_id]},#{params["page"]}", "document_fields")

      document_field_serializer = nil

      if !cached_document_fields
        agreement = Agreement.find_by(id: params["agreement_id"])
        document_fields = agreement.document_fields.limit_pages([params["page"]])
        document_field_serializer = parse_json document_fields
        # If cached page does not exist, likely expired, so cache again
        persist_document_fields_in_cache(agreement, 15)
      end # if !cached_document_fields
      p "In agreements, fetch_document_fields_for_page, cached_document_fields.class, document_field_serializer: " + cached_document_fields.class.to_s + ' ' + document_field_serializer.class.to_s

      json_response "Fetched document fields for agreement page succesfully", true, {
        document_fields: cached_document_fields ? JSON.parse(cached_document_fields) : document_field_serializer,
        agreement_id: params["agreement_id"]
      }, :ok
  end

  def cache_document_fields_for_pages
    # p "In agreements, cache_document_fields_for_pages, params: " + params.to_s
    agreement = Agreement.find_by(id: params["agreement_id"])
    # check if already persisted in redis
    keys_array_in_redis = $redis.keys(pattern = "*agreement:#{params["agreement_id"]},*")
    # cached_pages_array = []
    if agreement && keys_array_in_redis.length < 1 && !agreement.document_fields.empty?
      # Set expiration for keys in redis with second parameter in seconds
      persist_document_fields_in_cache(agreement, 15)
    end #if !agreement.document_fields.empty?

    json_response "Cached document fields for agreement succesfully", true, {
      # cached_pages_hash: {params["agreement_id"] => cached_pages_array }.to_json
    }, :ok
  end #  def cache_document_fields_for_pages

  # def delete_cached_document_fields_for_pages
  #   p "In agreements, delete_cached_document_fields_for_pages, params: " + params.to_s
  # end

  private

  def agreement_params
    params.require(:agreement).permit(
      :booking_id,
      :flat_id,
      :document_publicid,
      :document_pdf_publicid,
      :document_name,
      :tenant_signed,
      :owner_signed,
      :contractor_signed,
      :sent_to_tenant,
      :owner_approved,
      :tenant_approved,
      :contractor_approved,
      :language_code,
      :language_code_1,
      :template_file_name,
      :document_code,
      :document_pages,
      :document_type,
      :document_pdf_pages,
      :document_page_size,
      :document_pdf_page_size
      # document_fields_attributes: [
    )
  end
  #https://stackoverflow.com/questions/18595364/rails-strong-parameters-with-objects-array
  # IMPORTANT: value in document_fields is string, but need to make it text type.
  # Next time drop DB, edit the migration where document_field model is craeted and make value it text type
  # Tried changing type in a migration, but cannot due to foreign key constraint for some reason
  # migration is 20181218061751_create_document_fields.rb
  def document_field_params
    params.permit(document_field: [
      :id,
      :name,
      :agreement_id,
      :input_type,
      :text_align,
      :page,
      :val,
      :value,
      :enclosed_text,
      :top,
      :left,
      :width,
      :height,
      :font_size,
      :font,
      :font_family,
      :font_style,
      :font_weight,
      :margin,
      :border_color,
      :class_name,
      :class_name_1,
      :component_type,
      :component_name,
      :component,
      :display_text,
      :template_file_name,
      :list_parameters,
      # translation_element is translation field has document_field_translations
      :translation_element,
      # translation is for a regular element that is a translation (e.g. select that is a translation)
      :translation,
      :transform,
      :transform_origin,
      :original_value,
      :custom_name,
      document_field_translations_attributes: [
        :id,
        :language_code,
        :value
      ],
      # _attributes required for nested attributes (see agreement model)
      document_field_choices_attributes: [
        :id,
        :document_field_id,
        :val,
        :valName,
        :top,
        :left,
        :width,
        :height,
        :class_name,
        :border_radius,
        :border,
        :border_color,
        :border_width,
        :border_style,
        :underline,
        :margin,
        :text_align,
        :background_color,
        :font_style,
        :font_size,
        :font_color,
        :font_weight,
        :font_family,
        :input_type,
        # _attributes required for nested attributes (see document_field_choice model)
        select_choices_attributes: [
          :id,
          :document_field_choice_id,
          :value,
          :val
        ] # end of select_choices_attributes
      ] # end of document_field_choices_attributes
    ] # end of params permit
  )
end # end of def document_field_params

  # def document_field_choice_params
  #   params.permit(document_field_choice: [
  #     :id,
  #     :document_field_id,
  #     :val,
  #     :valName,
  #     :top,
  #     :left,
  #     :width,
  #     :height,
  #     :class_name,
  #     :border_radius,
  #     :border,
  #     :border_color,
  #     :border_width,
  #     :border_style,
  #     :underline,
  #     :margin,
  #     :text_align,
  #     :background_color,
  #     :font_style,
  #     :font_size,
  #     :font_color,
  #     :font_weight,
  #     :font_family,
  #     :input_type
  #   ]
  # )
  # end

  def load_agreement
    # front end gets params and sends it in fetchFlatFromParams
    @agreement = Agreement.find_by id: params[:id]
    unless @agreement.present?
      json_response "Cannot find agreement", false, {}, :not_found
    end
  end

  def valid_token
    @user = User.find_by authentication_token: request.headers["AUTH-TOKEN"]
    if @user
      return @user
    else
      json_response "Invalid token", false, {}, :failure
    end
  end

  def upload_image(params_file)
    uploaded_io = params_file
    path = Rails.root.join("public/system/temp_files/images", uploaded_io.original_filename)
    # open file for writing in binary
    File.open(path, 'wb') do |file|
      file.write(uploaded_io.read)
    end

    image = File.open(path)
    result = Cloudinary::Uploader.upload(image, options = {})
    File.delete(path) if path

    return result
  end

  def get_user_agreements_objects
    user_bookings = Booking.where(flat_id: Flat.where(user_id: @user.id).pluck(:id))
    user_flats = Flat.where(user_id: @user.id)
    # p "In agreement, fetch_user_agreements user_agreements: " + user_agreements_array_sorted.count.to_s
    user_agreements_array_sorted = Agreement.for_user(@user.id).order_by_updated_at_desc
    mapped_user_bookings = {}
    mapped_user_flats = {}
    mapped_agreements_by_flat = {}
    all_user_agreements_mapped = {}

    user_bookings.each { |each| mapped_user_bookings[each.id] = parse_json each }
    user_flats.each { |each| mapped_user_flats[each.id] = parse_json each }

    user_agreements_serializer = parse_json user_agreements_array_sorted

    user_agreements_array_sorted.each do |each|
      all_user_agreements_mapped[each.id] = parse_json each
    end

    return {
      all_user_agreements_mapped: all_user_agreements_mapped,
      user_agreements_serializer: user_agreements_serializer,
      mapped_user_bookings: mapped_user_bookings,
      mapped_user_flats: mapped_user_flats,
      # user_agreements_serializer: user_agreements_serializer
    }
  end # def get_user_agreements_objects

  def persist_document_fields_in_cache(agreement, expiration_in_seconds)
    page_num = 0
    last_page = agreement.document_pages.to_i
    # [*1..last_page].each do |page_num|
    document_fields_all = DocumentField.where(agreement_id: agreement.id )
    # p "In agreements, persist_document_fields_in_cache, page #" + page_num.to_s + ' cached; ' + ' last_page: ' + last_page.to_s + ' agreement: ' + agreement.id.to_s + ' document_fields_all: ' + document_fields_all.count.to_s
    if !document_fields_all.empty?
      # [1, 2 ].each do |page_num|
      agreement.document_pages.times {|page|
        page_num = page + 1
        document_fields = []
        p "In agreements, persist_document_fields_in_cache, working on page #" + page_num.to_s + ' for agreement id: ' + agreement.id.to_s
        if (page_num > 0) && (page_num <= last_page)
          # cache_exists = $redis.hget("agreement:#{params[:agreement_id]},#{params[page]}", "document_fields")
          # if !cache_exists
          # end
          # document_fields = agreement.document_fields.limit_pages([page_num])
          document_fields = document_fields_all.select {|each_df| each_df.page == page_num}
          if document_fields.length > 0
            document_field_serializer = parse_json document_fields
            redis_key = "agreement:#{agreement.id},#{page_num}"
            cached_document_field_for_page_created = $redis.hmset(redis_key, "document_fields", document_field_serializer.to_json)
            # Set expiration only if not standard_document
            cached_document_field_expiration_set = $redis.expire(redis_key, expiration_in_seconds) if !agreement.standard_document && cached_document_field_for_page_created == "OK"
            p "In agreements, persist_document_fields_in_cache, page #" + page_num.to_s + ' cached; document_fields count: ' + document_fields.count.to_s if cached_document_field_for_page_created == "OK" && cached_document_field_expiration_set == 1
            # cached_pages_array.push(page_num) if cached_document_field_for_page_created == 'OK'
            # break if cached_document_field_for_page_created !== "OK"
          end # if !document_fields.empty?
        end #  if page_num > 1 && page_num < document_pages
    # end #document_pages.times do |page|
    }
  end #  if !document_fields_all.empty?
    # return cached_pages_array
  end # def persist_document_fields_in_cache(agreement)
end
