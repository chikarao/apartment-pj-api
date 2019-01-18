class Api::V1::AgreementsController < ApplicationController
  # before_action :load_flat, only: [:destroy, :show, :create, :update]
  before_action :load_agreement, only: [:destroy, :show, :update]
  before_action :valid_token, only: [:destroy, :show, :create, :update]

  def show
    if @agreements
      agreement_serializer = parse_json @agreement
      # agreement_serializer = parse_json @agreement
      json_response "Showed agreement succesfully", true, {agreement: agreement_serializer}, :ok
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
    p "document_field_params.document_field.count: " + document_field_params["document_field"].count.to_s
    if agreement.save
      document_field_params["document_field"].each do |each|
        # p "each: " + each.to_s
        document_field_instance = DocumentField.new(each)
        document_field_instance.agreement_id = agreement.id

        # document_field.field_name = params[each].field_name
        # document_field.agreement_id = agreement.id
        # document_field.value = params[each].value
        if document_field_instance.save
          # return
        else
          agreement.destroy
          break
          # json_response "Create agreement failed", false, {}, :unprocessable_entity
        end
      end
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
    end

    # if save_and_create: true sent in params
    if params[:save_and_create]
      # document_field = DocumentField.find_by(id: document_field_params["document_field"][0][:id])
      agreement = Agreement.find_by(id: params[:agreement_id])
      document_fields = DocumentField.where(agreement_id: agreement.id)
      cloudinary_result = create_pdf(document_fields, params[:template_file_name], params[:save_and_create])
      # p "after cloudinary create, cloudinary_result[public_id]: " + cloudinary_result["public_id"].to_s
      # p "cloudinary_result: " + cloudinary_result.to_s
      unless !agreement.document_publicid
        result = Cloudinary::Uploader.destroy(agreement.document_publicid);
        # p "after cloudinary destroy result, params[:save_and_create]: " + result.to_s + params[:save_and_create].to_s
      end
      agreement.document_publicid = cloudinary_result["public_id"]

      unless agreement.save
        # json_response "Update agreement but create PDF failed", false, {}, :unprocessable_entity
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
      json_response "Updated agreement fields and created PDF succesfully", true, {agreement: agreement_serializer, booking: booking_serializer}, :ok
    end
  end

  def update
    if @agreement.update agreement_params
      booking = Booking.find_by(id: agreement_params[:booking_id])
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
        result = Cloudinary::Uploader.destroy(image_to_destroy);
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
      :margin,
      :class_name,
      :class_name_1,
      :component_type,
      :component_name,
      :display_text,
      ]
    )
  end

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
