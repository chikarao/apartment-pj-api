class Api::V1::FlatLanguagesController < ApplicationController
  # before_action :ensure_params_exist, only: :create
  before_action :valid_token, only: [:create, :update, :destroy]
  before_action :load_flat_language, only: [:update, :destroy]

  def index
  end

  def show
  end

  def new
  end

  def create
    # check for flat_id
    if (flat_language_params[:flat_id])
      flat_language = FlatLanguage.new flat_language_params
      if flat_language.save
        p 'flat_language saved' + flat_language.to_s
        flat = Flat.find_by(id: flat_language_params[:flat_id])
        flat_serializer = parse_json flat
        flat_language_serializer = parse_json flat_language
        json_response "Created flat_language succesfully", true, {flat_language: flat_language_serializer, flat: flat_serializer }, :ok
      else
        json_response "Create flat_language failed", false, {}, :unprocessable_entity
      end
    else
      json_response "Create flat_language failed; Provide flat_id", false, {}, :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @flat_language.update flat_language_params
      flat = Flat.find_by(id: flat_language_params[:flat_id])
      flat_serializer = parse_json flat
      flat_language_serializer = parse_json @flat_language
      json_response "Updated flat_language succesfully", true, {flat_language: flat_language_serializer, flat: flat_serializer}, :ok
    else
      json_response "Update flat failed", false, {}, :unprocessable_entity
    end
  end

  def destroy
    # flat_language delete request by flat owner
    if @flat_language.destroy
      flat = Flat.find_by(id: params[:flat_id])
      flat_serializer = parse_json flat
      json_response "Deleted flat_language succesfully", true, {flat: flat_serializer}, :ok
    else
      json_response "Delete flat_language failed", false, {}, :unprocessable_entity
    end
  end


  private

  def flat_language_params
    # params.require(:flat_language).permit(:flat_id, :code)
    params.require(:flat_language).permit(:flat_id,
      :language_code,
      :address1,
      :address2,
      :city,
      :state,
      :zip,
      :region,
      :country,
      :area,
      :sales_point,
      :description,
      :flat_type,
      :intro,
      :cancellation,
      :construction,
      :school_district,
      :school_district1,
      :station,
      :station1,
      :owner_name,
      :owner_contact_name,
      :owner_address,
      :owner_phone
    )
  end

  def valid_token
    @user = User.find_by authentication_token: request.headers["AUTH-TOKEN"]
    if @user
      return @user
    else
      json_response "Invalid token", false, {}, :failure
    end
  end

  def load_flat_language
    @flat_language = FlatLanguage.find_by id: params[:id]
    unless @flat_language.present?
      json_response "Cannot find flat_language", false, {}, :not_found
    end
  end

end
