class Api::V1::FacilitiesController < ApplicationController
  # before_action :load_facility, only: [:destroy, :show, :create, :update]
  before_action :load_facility, only: [:destroy, :update, :fetch_faclities_for_flat]
  # before_action :load_facility, only: :destroy
  before_action :valid_token, only: [:index, :destroy, :create, :update]

  def fetch_facilities_for_flat
    facilities = Facility.where(flat_id: facility_params[:flat_id])
    unless facilities.empty?
      # @facility.save
      facility_serializer = parse_json facilities
      # facility_serializer = parse_json @facility
      json_response "Fetched facilities succesfully", true, {facilities: facility_serializer}, :ok
    else
      json_response "Fetch facilities failed", false, {}, :unprocessable_entity
    end

  end

  def create
    facility = Facility.new facility_params
    facility.created_at = DateTime.now
    # facility.flat_id = facility_params[:flat_id]
    # only if have parent
    # facility.book_id = params[:book_id]
    if facility.save
      flat = Flat.find_by(id: facility_params[:flat_id])
      # facility_serializer = parse_json facility
      # @facility.facility_id = facility.id
      # @facility.save
      flat_serializer = parse_json flat
      # facility_serializer = parse_json @facility
      json_response "Created facility succesfully", true, {flat: flat_serializer}, :ok
    else
      json_response "Create facility failed", false, {}, :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @facility.update facility_params
      flat = Flat.find_by(id: facility_params[:flat_id])
      flat_serializer = parse_json flat
      # facility = Flat.find_by(id: params[:facility_id])
      # facility_serializer = parse_json @facility
      # facility_serializer = parse_json @facility
      json_response "Updated facility succesfully", true, {flat: flat_serializer}, :ok
    else
      json_response "Update facility failed", false, {}, :unprocessable_entity
    end
  end

  def destroy
      flat_id = @facility.flat_id
      p "@facility.flat_id" + @facility.flat_id.to_s
      if @facility.destroy
        flat = Flat.find_by(id: flat_id)
        p "@flat.id" + flat.id.to_s

        flat_serializer = parse_json flat
        json_response "Deleted facility succesfully", true, {flat: flat_serializer}, :ok
      else
        json_response "Delete facility failed", false, {}, :unprocessable_entity
      end
  end

  private

  # def load_facility
  #   # front end gets params and sends it in fetchFlatFromParams
  #   @facility = Flat.find_by id: params[:facility_id]
  #   unless @facility.present?
  #     json_response "Cannot find facility", false, {}, :not_found
  #   end
  # end

  def facility_params
    params.require(:facility).permit(
      :flat_id,
      # :booking_id,
      :optional,
      :facility_type,
      :price_per_month,
      :discount,
      :facility_number, :facility_deposit,
      :facility_key_money,
      :facility_management_fees,
      :facility_format,
      :facility_broker_fees,
      :facility_name,
      :on_building_grounds
    )
  end

  def load_facility
    # front end gets params and sends it in fetchFlatFromParams
    @facility = Facility.find_by id: params[:id]
    unless @facility.present?
      json_response "Cannot find facility", false, {}, :not_found
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
