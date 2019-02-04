class Api::V1::BuildingLanguagesController < ApplicationController
  # before_action :load_building, only: [:destroy, :show, :update]
  before_action :load_building_language, only: [:destroy, :show, :update]
  # before_action :load_building_language, only: :destroy
  before_action :valid_token, only: [:destroy, :create, :update]

  # def index
  # end
  # def show
  #   if @building_languages
  #     flat_serializer = parse_json @flat
  #     # building_language_serializer = parse_json @building_language
  #     json_response "Showed building_language succesfully", true, {flat: flat_serializer}, :ok
  #   else
  #     json_response "Show flat failed", false, {}, :unprocessable_entity
  #   end
  # end
  #
  # def new
  # end

  def create
    building_language = BuildingLanguage.new building_language_params
    building_language.created_at = DateTime.now
    building = Building.find_by(id: building_language_params[:building_id])
    flat = Flat.find_by(id: params[:flat_id])
    # only if have parent
    # building_language.book_id = params[:book_id]
    if building_language.save
      building_language_serializer = parse_json building_language
      building_serializer = parse_json building
      flat_serializer = parse_json flat
      json_response "Created building_language succesfully", true, {flat: flat_serializer, building_language: building_language_serializer, building: building_serializer}, :ok
    else
      json_response "Create building_language failed", false, {}, :unprocessable_entity
    end
  end

  def edit
  end

  def update
    flat = Flat.find_by(id: params[:flat_id])
    building = Building.find_by(id: @building_language.building_id)

    if @building_language.update building_language_params
      building_language_serializer = parse_json @building_language
      building_serializer = parse_json building
      flat_serializer = parse_json flat
      json_response "Updated building_language succesfully", true, {flat: flat_serializer, building_language: building_language_serializer, building: building_serializer}, :ok
    else
      json_response "Update flat failed", false, {}, :unprocessable_entity
    end
  end

  def destroy
    p "!!!! params[:flat_id]" + params[:flat_id].to_s
    flat = Flat.find_by(id: params[:flat_id])
    # building = Building.find_by(id: @building_language.building_id)
    p "!!!! flat, @building_language" + flat.to_s + @building_language.to_s

    if @building_language.destroy
      # building_serializer = parse_json building
      flat_serializer = parse_json flat
      json_response "Deleted building_language succesfully", true, {flat: flat_serializer}, :ok
    else
      json_response "Delete building_language failed", false, {}, :unprocessable_entity
    end
  end

  private

  def building_language_params
    params.require(:building_language).permit(
      :building_id,
      :name,
      :address1,
      :address2,
      :city,
      :state,
      :zip,
      :region,
      :country,
      :construction,
      :building_type,
      :building_management_company,
      :building_management_contact,
      :asbestos_survey_contents,
      :earthquake_study_contents,
      :building_owner_name,
      :building_owner_address,
      :language_code,
      :legal_restrictions,
      :legal_restrictions_summary)
  end

  def load_building_language
    # front end gets params and sends it in fetchFlatFromParams
    @building_language = BuildingLanguage.find_by id: params[:id]
    unless @building_language.present?
      json_response "Cannot find building_language", false, {}, :not_found
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
