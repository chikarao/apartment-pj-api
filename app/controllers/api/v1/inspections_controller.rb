class Api::V1::InspectionsController < ApplicationController
  before_action :load_flat, only: [:destroy, :show, :create, :update]
  before_action :load_inspection, only: [:destroy, :show, :update]
  # before_action :load_inspection, only: :destroy
  before_action :valid_token, only: [:destroy, :create, :update]

  def show
    if @inspections
      inspection_serializer = parse_json @inspection
      # inspection_serializer = parse_json @inspection
      json_response "Showed inspection succesfully", true, {inspection: inspection_serializer}, :ok
    else
      json_response "Show inspection failed", false, {}, :unprocessable_entity
    end
  end
  #
  # def new
  # end

  def create
    inspection = Inspection.new inspection_params
    inspection.created_at = DateTime.now
    # only if have parent
    # inspection.book_id = params[:book_id]
    if inspection.save

      flat_serializer = parse_json @flat
      inspection_serializer = parse_json inspection
      json_response "Created inspection succesfully", true, {flat: flat_serializer}, :ok
    else
      json_response "Create inspection failed", false, {}, :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @inspection.update inspection_params
      # flat = Flat.find_by(id: params[:flat_id])
      flat_serializer = parse_json @flat
      # inspection_serializer = parse_json @inspection
      json_response "Updated inspection succesfully", true, {flat: flat_serializer}, :ok
    else
      json_response "Update flat failed", false, {}, :unprocessable_entity
    end
  end

  def destroy
      @building = Building.find_by(id: @inspection.building_id)
      @flat = Flat.find_by(building_id: @building.id)
      if @inspection.destroy
        flat_serializer = parse_json @flat
        json_response "Deleted inspection succesfully", true, {flat: flat_serializer}, :ok
      else
        json_response "Delete inspection failed", false, {}, :unprocessable_entity
      end
  end

  private

  def load_flat
    # front end gets params and sends it in fetchFlatFromParams
    @flat = Flat.find_by building_id: params[:building_id]
    unless @flat.present?
      json_response "Cannot find flat", false, {}, :not_found
    end
  end

  def inspection_params
    params.require(:inspection).permit(
      :building_id,
      :inspection_language,
      :inspection_date,
      :inspection_summary,
      :inspector_name,
      :inspector_trainer,
      :inspector_certificate_number,
      :architect_qualification_type,
      :architect_type,
      :architect_registration_number,
      :architect_registration_type,
      :architect_office_name,
      :architect_office_registration,
      :foundation,
      :floor_assembly,
      :floor,
      :pillars,
      :exterior_walls,
      :balcony,
      :interior_walls,
      :ceilings,
      :roof_truss,
      :termite_damage,
      :corrosion,
      :reinforcement,
      :concrete_compression,
      :exterior_walls_rain,
      :eaves_rain,
      :balcony_rain,
      :interior_walls_rain,
      :ceilings_rain,
      :roof_truss_rain,
      :roof,
      :exterior_walls_rain)
  end

  def load_inspection
    # front end gets params and sends it in fetchFlatFromParams
    @inspection = Inspection.find_by id: params[:id]
    unless @inspection.present?
      json_response "Cannot find inspection", false, {}, :not_found
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
