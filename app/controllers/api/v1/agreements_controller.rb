class Api::V1::AgreementsController < ApplicationController
  # include DocumentTranslationImportantPoints
  # include DocumentTranslationFixedTerm
  include ContractTranslationMapObject
  include CreatePdf
  # before_action :load_flat, only: [:destroy, :show, :create, :update]
  before_action :load_agreement, only: [:destroy, :show, :update]
  before_action :valid_token, only: [:destroy, :show, :create, :update, :save_template_agreement_fields]

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
    agreement = Agreement.new agreement_params
    agreement.created_at = DateTime.now
    # just_document_keys_array = create_document_keys_array(params)
    # only if have parent
    # agreement.book_id = params[:book_id]
    # p "document_field_params.document_field.count: " + document_field_params["document_field"].count.to_s
    if agreement.save
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
    else
      json_response "Create agreement failed", false, {}, :unprocessable_entity
    end
  end

  # def edit
  # end

  def save_template_agreement_fields
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

    # IMPORTANT: agreement serializer and document_field_serializer have a custom document_field
    # and document_field_choice serializer that returns document_field_choices
    # Rails default depth of child ssociations is one, so use custom to get another layer
    agreements = Agreement.where(booking_id: params[:booking_id])
    document_fields = agreement.document_fields
    # agreement_serializer = parse_json agreement
    agreement_serializer = parse_json agreements
    document_field_serializer = parse_json document_fields
    booking_serializer = parse_json booking
    # if none of the above each loops do not break, send successful json response
    json_response "Saved template agreement fields successfully", true, {agreements: agreement_serializer, document_fields: document_field_serializer, booking: booking_serializer}, :ok
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
      cloudinary_result = create_pdf(document_fields, contract_name, params[:save_and_create], translation, document_language_code, document_insert_main)
      # p "after cloudinary create, cloudinary_result[public_id]: " + cloudinary_result["public_id"].to_s
      # p "cloudinary_result, cloudinary_result.class: " + cloudinary_result.to_s + " " + cloudinary_result.class.to_s
      unless !agreement.document_publicid
        result = Cloudinary::Uploader.destroy(agreement.document_publicid);
        # p "after cloudinary destroy result, params[:save_and_create]: " + result.to_s + params[:save_and_create].to_s
      end
      agreement.document_publicid = cloudinary_result["public_id"]
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
    image_to_destroy = @agreement.document_publicid
    if @agreement.update agreement_params
      booking = Booking.find_by(id: agreement_params[:booking_id])
      if agreement_params[:document_publicid]
        result = Cloudinary::Uploader.destroy(image_to_destroy);
      end
      booking_serializer = parse_json booking
      # flat = Flat.find_by(id: params[:flat_id])
      agreement_serializer = parse_json @agreement
      # agreement_serializer = parse_json @agreement
      json_response "Updated agreement succesfully", true, {agreement: agreement_serializer, booking: booking_serializer}, :ok
    else
      json_response "Update flat failed", false, {}, :unprocessable_entity
    end
  end

  def destroy
    booking = Booking.find_by(id: @agreement.booking_id)
    image_to_destroy = @agreement.document_publicid
    if @agreement.destroy
      # check if image_to_destroy = null in case no pdf create yet
      unless !image_to_destroy
        result = Cloudinary::Uploader.destroy(image_to_destroy);
      end
      booking_serializer = parse_json booking
      # agreement_serializer = parse_json @agreement
      json_response "Deleted agreement succesfully", true, {booking: booking_serializer}, :ok
    else
      json_response "Delete agreement failed", false, {}, :unprocessable_entity
    end
  end

  private

  def agreement_params
    params.require(:agreement).permit(
      :booking_id,
      :flat_id,
      :document_publicid,
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
      :document_type
      # document_fields_attributes: [
    )
  end
  #https://stackoverflow.com/questions/18595364/rails-strong-parameters-with-objects-array
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
      :translation_element,
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

  # def create_document_keys_array(paramsObject)
  #   exceptionArray = ["flat_id", "contract_name", "booking_id"]
  #   # select returns only those matching criteion; map returns nil if no match
  #   # return array of keys from params (just document keys)
  #   objectReturned = paramsObject.keys.select {|key| key if !exceptionArray.include?(key) }
  #   return objectReturned
  # end
end

# def document_params
#   params.permit(document: [
#     :id,
#     :name,
#     :agreement_id,
#     choice: [
#       :id,
#       :document_id,
#       :text
#     ]
#   ]
# end
#
# {"id"=>2, "agreement_name"=>"test4", "document"=>[{"id"=>1, "name"=>"test1", "agreement_id"=>2, "choice"=>[{"id"=>1, "document_id"=>1, "text"=>"abc"}, {"id"=>2, "document_id"=>1, "text"=>"def"}, {"id"=>3, "document_id"=>1, "text"=>"ghi"}]}]}
#
