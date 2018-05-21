class Api::V1::FlatsController < ApplicationController
  before_action :load_flat, only: [:show, :update, :destroy]
  before_action :valid_token, only: [:create, :update, :destroy]
  before_action :authenticate_with_token, only: [:create, :update, :destroy]

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
    flat = Flat.new flat_params
    flat.user_id = @user.id
    flat.created_at = DateTime.now
    # only if have parent
    # flat.book_id = params[:book_id]
    if flat.save
      flat_serializer = parse_json flat

      json_response "Created flat succesfully", true, {flat: flat_serializer}, :ok
    else
      json_response "Create flat failed", false, {}, :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @flat.update flat_params
      flat_serializer = parse_json @flat
      json_response "Updated flat succesfully", true, {flat: flat_serializer }, :ok
    else
      json_response "Update flat failed", false, {}, :unprocessable_entity
    end
  end

  def destroy
    p current_user
    p @flat
    if @flat.user_id = current_user.id

      image_array = []
      images = @flat.images
      images.each do |i|
       p "FlatsController, destroy, images.each, i: " + i.to_s
      image_array << i.publicid
      end
      p "FlatsController, destroy, image_array: " + image_array.to_s

      if @flat.destroy
        image_array.each do |i|
          p "FlatsController, destroy, images.each, i: " + i.to_s
          result = Cloudinary::Uploader.destroy(i);
          p "FlatsController, destroy, images.each, result: " + result.to_s
        end
        json_response "Deleted flat succesfully", true, {flat: @flat}, :ok
      else
        json_response "Delete flat failed", false, {}, :unprocessable_entity
      end
    else
      json_response "Delete flat failed", false, {}, :unprocessable_entity
    end
    #end of first if
  end

  private

  def load_flat
    # front end gets params and sends it in fetchFlatFromParams
    @flat = Flat.find_by id: params[:id]
    unless @flat.present?
      json_response "Cannot find flat", false, {}, :not_found
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

  def flat_params
    params.require(:flat).permit(:user_id, :lat, :lng, :address1, :address2, :city, :state, :region, :zip, :country, :area,
    :price_per_day, :price_per_month, :guests, :sales_point, :description, :rooms, :beds, :flat_type, :bath, :intro, :cancellation, :smoking)
  end
end
