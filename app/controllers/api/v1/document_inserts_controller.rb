class Api::V1::DocumentInsertsController < ApplicationController
  # before_action :load_flat, only: [:destroy, :show, :create, :update]
  before_action :load_document_insert, only: [:destroy, :show, :update]
  before_action :valid_token, only: [:destroy, :show, :create, :update]

  def show
    # if @document_insert
    #   document_insert_serializer = parse_json @document_insert
    #   # document_insert_serializer = parse_json @document_insert
    #   json_response "Showed document_insert succesfully", true, {document_insert: document_insert_serializer}, :ok
    # else
    #   json_response "Show document_insert failed", false, {}, :unprocessable_entity
    # end
  end

  # def new
  # end

  def create
    document_insert = DocumentInsert.new document_insert_params
    document_insert.created_at = DateTime.now
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
        document_insert.publicid = result["public_id"]
        document_insert.pages = result["pages"]
        width = result["width"]
        height = result["height"]
        document_insert.page_size = "#{width},#{height}"
      else
        json_response "Create document insert failed because the pdf upload failed.", false, {}, :unprocessable_entity
        File.delete(path) if path
      end
    end
    # only if have parent
    # document_insert.book_id = params[:book_id]
    if result && document_insert.save
      agreement = Agreement.find_by(id: document_insert_params[:agreement_id])
      document_inserts_array = get_document_inserts_all(agreement)

      booking = Booking.find_by(id: agreement.booking_id)
      booking_serializer = parse_json booking
      agreement_serializer = parse_json agreement
      json_response "Created document_insert succesfully", true, {agreement: agreement_serializer, booking: booking_serializer, document_inserts_all: document_inserts_array}, :ok
      File.delete(path) if path
    else
      json_response "Create document_insert failed", false, {}, :unprocessable_entity
      File.delete(path) if path
    end
  end

  def edit
  end

  def update
    original_publicid = @document_insert.publicid
    # agreement = Agreement.find_by(id: @document_insert.agreement_id)
    result = true
    if !params[:file].blank?
      result = upload_image(params[:file])
      if result
        @document_insert.publicid = result["public_id"]
        @document_insert.pages = result["pages"]
        width = result["width"]
        height = result["height"]
        @document_insert.page_size = "#{width},#{height}"
      else
        json_response "Edit document insert failed because the pdf upload failed.", false, {}, :unprocessable_entity
        # File.delete(path) if path
      end
    end
    # agreements = Agreement.where(booking_id: agreement.booking_id)
    if result && @document_insert.update(document_insert_params)
      agreement = Agreement.find_by(id: @document_insert.agreement_id)
      booking = Booking.find_by(id: agreement.booking_id)
      booking_serializer = parse_json booking
      # flat = Flat.find_by(id: params[:flat_id])
      document_insert_serializer = parse_json @document_insert
      document_inserts_array = get_document_inserts_all(agreement)
      # p "!!!!!! Before destroying image : " + original_publicid.to_s + " " + document_insert_params[:publicid].to_s
      if @document_insert.publicid != original_publicid
        # p "!!!!!! Destroying image : " + original_publicid.to_s + " " + document_insert_params[:publicid].to_s
        image_to_destroy = original_publicid
        result = Cloudinary::Uploader.destroy(image_to_destroy);
        # p "!!!!!! Destroying image : " + original_publicid.to_s + " " + document_insert_params[:publicid].to_s
      end
      json_response "Updated document_insert succesfully", true, {document_insert: document_insert_serializer, booking: booking_serializer, document_inserts_all: document_inserts_array}, :ok
    else
      json_response "Update flat failed", false, {}, :unprocessable_entity
    end
  end

  def destroy
    agreement = Agreement.find_by(id:  @document_insert.agreement_id)
    # agreements = Agreement.where(booking_id: agreement.booking_id)
    booking = Booking.find_by(id: agreement.booking_id)
    image_to_destroy = @document_insert.publicid
    if @document_insert.destroy
      result = Cloudinary::Uploader.destroy(image_to_destroy);
      booking_serializer = parse_json booking
      document_insert_serializer = parse_json @document_insert
      document_inserts_array = get_document_inserts_all(agreement)

      json_response "Deleted document_insert succesfully", true, {booking: booking_serializer, document_inserts_all: document_inserts_array}, :ok
    else
      json_response "Delete document_insert failed", false, {}, :unprocessable_entity
    end
  end

  private

  def document_insert_params
    params.require(:document_insert).permit(
      :agreement_id,
      :publicid,
      :result,
      :main_agreement,
      :insert_after_page,
      :pages,
      :from_page,
      :to_page,
      :insert_name,
      :page_size
    )
  end

  def load_document_insert
    # front end gets params and sends it in fetchFlatFromParams
    @document_insert = DocumentInsert.find_by id: params[:id]
    unless @document_insert.present?
      json_response "Cannot find document_insert", false, {}, :not_found
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

  def get_document_inserts_all(agreement)
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

end
