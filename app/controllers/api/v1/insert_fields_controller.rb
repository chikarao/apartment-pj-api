class Api::V1::InsertFieldsController < ApplicationController
  # before_action :load_flat, only: [:destroy, :show, :create, :update]
  before_action :load_insert_field, only: [:destroy, :show, :update]
  before_action :valid_token, only: [:destroy, :show, :create, :update]

  def show
    # if @insert_field
    #   insert_field_serializer = parse_json @insert_field
    #   # insert_field_serializer = parse_json @insert_field
    #   json_response "Showed insert_field succesfully", true, {insert_field: insert_field_serializer}, :ok
    # else
    #   json_response "Show insert_field failed", false, {}, :unprocessable_entity
    # end
  end

  # def new
  # end

  def create
    insert_field = InsertField.new insert_field_params
    insert_field.created_at = DateTime.now
    # only if have parent
    # insert_field.book_id = params[:book_id]
    if insert_field.save
      document_insert = DocumentInsert.find_by(id: insert_field_params[:document_insert_id])
      agreement = Agreement.find_by(id: document_insert[:agreement_id])
      document_inserts_array = getDocumentInsertsAll(agreement)

      # agreements = Agreement.where(booking_id: agreement.booking_id)
      # document_inserts_array = []
      # agreements.each do |each_agreement|
      #   document_inserts = DocumentInsert.where(agreement_id: each_agreement.id)
      #   if !document_inserts.empty?
      #     document_inserts.each do |each_insert|
      #       document_inserts_serializer = parse_json each_insert
      #       document_inserts_array.push(document_inserts_serializer)
      #     end
      #   end
      # end
      # booking = Booking.find_by(id: agreement.booking_id)
      # booking_serializer = parse_json booking
      # agreement_serializer = parse_json agreement
      document_insert_serializer = parse_json agreement.document_inserts
      # insert_field_serializer = parse_json insert_field
      json_response "Created insert_field succesfully", true, {document_inserts: document_insert_serializer, document_inserts_all: document_inserts_array}, :ok
      # json_response "Created insert_field succesfully", true, {agreement: agreement_serializer, booking: booking_serializer, document_inserts: document_insert_serializer}, :ok
    else
      json_response "Create insert_field failed", false, {}, :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @insert_field.update insert_field_params
      document_insert = DocumentInsert.find_by(id: insert_field_params[:document_insert_id])
      agreement = Agreement.find_by(id: document_insert[:agreement_id])
      # booking = Booking.find_by(id: agreement.booking_id)
      document_insert_serializer = parse_json agreement.document_inserts
      # agreements = Agreement.where(booking_id: agreement.booking_id)
      document_inserts_array = getDocumentInsertsAll(agreement)
      # agreements.each do |each_agreement|
      #   document_inserts = DocumentInsert.where(agreement_id: each_agreement.id)
      #   if !document_inserts.empty?
      #     document_inserts.each do |each_insert|
      #       document_inserts_serializer = parse_json each_insert
      #       document_inserts_array.push(document_inserts_serializer)
      #     end
      #   end
      # end
      # booking_serializer = parse_json booking
      # flat = Flat.find_by(id: params[:flat_id])
      # insert_field_serializer = parse_json @insert_field
      # insert_field_serializer = parse_json @insert_field
      json_response "Updated insert_field succesfully", true, {document_inserts: document_insert_serializer, document_inserts_all: document_inserts_array}, :ok
    else
      json_response "Update flat failed", false, {}, :unprocessable_entity
    end
  end

  def destroy
    document_insert = DocumentInsert.find_by(id: @insert_field[:document_insert_id])
    agreement = Agreement.find_by(id: document_insert[:agreement_id])
    # agreements = Agreement.where(booking_id: agreement.booking_id)
    # booking = Booking.find_by(id: agreement.booking_id)
    if @insert_field.destroy
      document_insert_serializer = parse_json agreement.document_inserts
      document_inserts_array = getDocumentInsertsAll(agreement)
      # document_inserts_array = []
      # agreements.each do |each_agreement|
      #   document_inserts = DocumentInsert.where(agreement_id: each_agreement.id)
      #   if !document_inserts.empty?
      #     document_inserts.each do |each_insert|
      #       document_inserts_serializer = parse_json each_insert
      #       document_inserts_array.push(document_inserts_serializer)
      #     end
      #   end
      # end
      # insert_field_serializer = parse_json @insert_field
      json_response "Deleted insert_field succesfully", true, {document_inserts: document_insert_serializer, document_inserts_all: document_inserts_array}, :ok
    else
      json_response "Delete insert_field failed", false, {}, :unprocessable_entity
    end
  end

  private

  def insert_field_params
    params.require(:insert_field).permit(
      :document_insert_id,
      :name,
      :value,
      :language_code
    )
  end

  def load_insert_field
    # front end gets params and sends it in fetchFlatFromParams
    @insert_field = InsertField.find_by id: params[:id]
    unless @insert_field.present?
      json_response "Cannot find insert_field", false, {}, :not_found
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

  def getDocumentInsertsAll(agreement)
    agreements = Agreement.where(booking_id: agreement.booking_id)
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
    return document_inserts_array
  end

end
