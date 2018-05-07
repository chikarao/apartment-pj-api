class Api::V1::FlatsController < ApplicationController
  before_action :load_flat, only: :show

  def index
    # this is for fetchFlats in front end
    if params[:east] && params[:west] && params[:north] && params[:south]
      p params[:east].to_f
      p params[:west].to_f
      p params[:north].to_f
      p params[:south].to_f

      @flats = Flat.where('lat < (?) AND lat > (?) AND lng < (?) AND lng > (?)', params[:north].to_f, params[:south].to_f, params[:east].to_f, params[:west].to_f).includes(:images)
      flats_serializer = parse_json @flats
      json_response "Indexed flats within area successfully", true, {flats: flats_serializer}, :ok
    else
      @flats = Flat.all
      # does not need includes; flat_serializer has_many images and bookings will fetch both
      # @flats = Flat.all.includes(:images)
      flats_serializer = parse_json @flats
      json_response "Indexed flats successfully", true, {flats: flats_serializer}, :ok
    end
  end

  def show
    #this is for show_flats in front end
    flat_serializer = parse_json @flat
    json_response "Showed flat successfully", true, {flat: flat_serializer}, :ok
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def load_flat
    # front end gets params and sends it in fetchFlatFromParams
    @flat = Flat.find_by id: params[:id]
    unless @flat.present?
      json_response "Cannot find flat", false, {}, :not_found
    end
  end

  def strong_params
    params.require(:flat).permit(:user_id, :lat, :lng, :address1, :city, :zip, :country, :area,
    :price_per_day, :price_per_month, :guests, :sales_point, :description,
    :rooms, :beds, :flat_type, :bath)
  end
end
