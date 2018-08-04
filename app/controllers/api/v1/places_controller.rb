class Api::V1::PlacesController < ApplicationController
  before_action :load_flat, only: :show
  before_action :valid_token, only: [:destroy, :create]
  before_action :authenticate_with_token, only: [:create, :destroy]
  before_action :load_place, only: [:destroy]

  def index
    # index for fetchPlaces action in front end; returns array of places for specific flat id
    @places = Place.where(flat_id: params[:flat_id])
    unless @places.empty?
      places_serializer = parse_json @places
      json_response "Fetched places succesfully", true, {places: places_serializer}, :ok
    else
      json_response "Fetch places failed", false, {}, :unprocessable_entity
    end
  end

  def show
  end

  def new
  end
  # Create for createPlace action in front end;
  #  !!!! Returns full array of places for flat with new place
  def create
    place = Place.new place_params
    # p "places controller, place: " + place.to_s
    place.flat_id = params[:flat_id]
    # place.user_id = @user.id
    # place.flat_id = params[:id]
    if place.save
      places = Place.where(flat_id: params[:flat_id])
      p "places controller, places: " + places.to_s
      places_serializer = parse_json places
      json_response "Created place succesfully; Sending updated places", true, {places: places_serializer}, :ok
    else
      json_response "Create place failed", false, {}, :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  # Destroy for delete Place action in front end;
  #  !!!! Returns full array of places for flat with place deleted
  def destroy
    p "places controller, @place: " + @place.to_s
    if @user.id = current_user.id
      if @place.destroy
        places = Place.where(flat_id: params[:flat_id])
        places_serializer = parse_json places
        json_response "Deleted place succesfully, Sending updated places", true, {places: places_serializer}, :ok
      else
        json_response "Delete place failed", false, {}, :unprocessable_entity
      end
    else
      json_response "Delete place failed", false, {}, :unprocessable_entity
    end
  end

  private

  def load_flat
    # front end gets params and sends it in fetchFlatFromParams
    @flat = Flat.find_by id: params[:id]
    unless @flat.present?
      json_response "Cannot find flat", false, {}, :not_found
    end
  end

  def place_params
    params.require(:place).permit(:flat_id, :placeid, :place_name, :lat, :lng, :category)
  end

  def load_place
    # front end gets params and sends it in fetchFlatFromParams
    @place = Place.find_by(id: params[:id])
    unless @place.present?
      json_response "Cannot find place", false, {}, :not_found
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
