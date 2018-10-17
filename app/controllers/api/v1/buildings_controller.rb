class Api::V1::BuildingsController < ApplicationController
  before_action :load_flat, only: [:destroy, :show, :create, :update]
  before_action :load_building, only: [:destroy, :show, :update]
  # before_action :load_building, only: :destroy
  before_action :valid_token, only: [:destroy, :create, :update, :search_buildings]

  # def index
  # end

  def search_buildings
    # search Buildings using the first two words of the address
    search_first_two_array = []
    search_condition_address1 = ''
    split_params_array = params[:address1].split
    if split_params_array.length > 1
      # get a string of the first two words of array of params address1
      search_condition = split_params_array.first(2).join(' ')
    else
      search_condition = params[:address1]
    end

    # p "BuildingsController index search_condition: " + search_condition.to_s

    buildings = Building.where("address1 LIKE ? AND city LIKE ?", "%#{search_condition}%", "%#{params[:city]}%")
    unless buildings.empty?
      p "BuildingsController index buildings[0]: " + buildings[0].name.to_s
      building_serializer = parse_json buildings
      json_response "Showed building succesfully", true, {buildings: building_serializer}, :ok
    else
      json_response "No buildings matched the query", false, {buildings: []}, :unprocessable_entity
    end
  end
  #
  def show
    if @buildings
      flat_serializer = parse_json @flat
      # building_serializer = parse_json @building
      json_response "Showed building succesfully", true, {flat: flat_serializer}, :ok
    else
      json_response "Show flat failed", false, {}, :unprocessable_entity
    end
  end
  #
  # def new
  # end

  def create
    building = Building.new building_params
    building.created_at = DateTime.now
    # only if have parent
    # building.book_id = params[:book_id]
    if building.save
      # building_serializer = parse_json building
      @flat.building_id = building.id
      @flat.save
      flat_serializer = parse_json @flat
      # building_serializer = parse_json @building
      json_response "Created building succesfully", true, {flat: flat_serializer}, :ok
    else
      json_response "Create building failed", false, {}, :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @building.update building_params
      # flat = Flat.find_by(id: params[:flat_id])
      flat_serializer = parse_json @flat
      # building_serializer = parse_json @building
      json_response "Updated building succesfully", true, {flat: flat_serializer}, :ok
    else
      json_response "Update flat failed", false, {}, :unprocessable_entity
    end
  end

  def destroy
      if @building.destroy
        json_response "Deleted building succesfully", true, {flat: @flat}, :ok
      else
        json_response "Delete building failed", false, {}, :unprocessable_entity
      end
  end

  private

  def load_flat
    # front end gets params and sends it in fetchFlatFromParams
    @flat = Flat.find_by id: params[:flat_id]
    unless @flat.present?
      json_response "Cannot find flat", false, {}, :not_found
    end
  end

  def building_params
    params.require(:building).permit(:name, :address1, :address2, :city, :state, :zip, :region, :country, :construction, :type, :year_built, :last_renovation_year, :units, :floors,
      :floors_underground, :power_usage_amount, :gas, :water, :sewage, :building_management_company, :building_management_phone, :building_management_contact, :building_inspection_conducted,
      :inside_disaster_prevention, :inside_disaster_warning, :inside_tsunami_warning, :asbestos_record, :asbestos_survey_contents, :earthquake_study_performed, :earthquake_study_contents,
      :building_owner_name, :building_owner_address, :building_owner_phone)
  end

  def load_building
    # front end gets params and sends it in fetchFlatFromParams
    @building = Building.find_by id: params[:building_id]
    unless @building.present?
      json_response "Cannot find building", false, {}, :not_found
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
