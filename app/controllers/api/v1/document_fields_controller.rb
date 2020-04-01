class Api::V1::DocumentFieldsController < ApplicationController
  # before_action :load_flat, only: [:destroy, :show, :create, :update]
  before_action :load_document_field, only: [:destroy, :show, :update]
  before_action :valid_token, only: [:destroy, :show, :create, :update]

  def show
    if @document_fields
      document_field_serializer = parse_json @document_field
      # document_field_serializer = parse_json @document_field
      json_response "Showed document_field succesfully", true, {document_field: document_field_serializer}, :ok
    else
      json_response "Show document_field failed", false, {}, :unprocessable_entity
    end
  end
  #
  # def new
  # end

  def create
    document_field = DocumentField.new document_field_params
    document_field.created_at = DateTime.now
    # only if have parent
    # document_field.book_id = params[:book_id]
    if document_field.save
      agreement = Agreement.find_by(id: document_field_params[:agreement_id])
      booking = Booking.find_by(id: agreement.booking_id)
      booking_serializer = parse_json booking
      document_field_serializer = parse_json document_field
      json_response "Created document_field succesfully", true, {document_field: document_field_serializer, booking: booking_serializer}, :ok
    else
      json_response "Create document_field failed", false, {}, :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @document_field.update document_field_params
      agreement = Agreement.find_by(id: document_field_params[:agreement_id])
      booking = Booking.find_by(id: agreement.booking_id)
      booking_serializer = parse_json booking
      # flat = Flat.find_by(id: params[:flat_id])
      document_field_serializer = parse_json @document_field
      # document_field_serializer = parse_json @document_field
      json_response "Updated document_field succesfully", true, {document_field: document_field_serializer, booking: booking_serializer}, :ok
    else
      json_response "Update flat failed", false, {}, :unprocessable_entity
    end
  end

  def destroy
    agreement = Agreement.find_by(id: document_field_params[:agreement_id])
    booking = Booking.find_by(id: agreement.booking_id)
    if @document_field.destroy
      booking_serializer = parse_json booking
      document_field_serializer = parse_json @document_field
      json_response "Deleted document_field succesfully", true, {booking: booking_serializer}, :ok
    else
      json_response "Delete document_field failed", false, {}, :unprocessable_entity
    end
  end

  private

  def document_field_params
    params.require(:document_field).permit(
      :field_name,
      :agreement_id,
      :val,
      :value,
      :enclosed_text,
      :top,
      :left,
      :height,
      :font_style,
      :font_size,
      :font_color,
      :font,
      :border_color,
      :border_width,
      :border_style,
      :underline,
      :italic,
      :background_color,
      :margin,
      :class_name,
      :class_name_1,
      :component_type,
      :component_name,
      :document_field_choices
    )
  end

  def load_document_field
    # front end gets params and sends it in fetchFlatFromParams
    @document_field = DocumentField.find_by id: params[:id]
    unless @document_field.present?
      json_response "Cannot find document_field", false, {}, :not_found
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
end
