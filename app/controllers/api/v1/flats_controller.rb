class Api::V1::FlatsController < ApplicationController
  before_action :load_flat, only: [:show, :update, :destroy]
  before_action :load_amenity, only: [:update]
  before_action :valid_token, only: [:create, :update, :destroy]
  before_action :authenticate_with_token, only: [:create, :update, :destroy]

  def index
    # this is for fetchFlats in front end
    if params[:east] && params[:west] && params[:north] && params[:south]
      # p params[:east].to_f
      # p params[:west].to_f
      # p params[:north].to_f
      # p params[:south].to_f
      p "!!!!!! price max: " + params[:price_max].to_s
      p "!!!!!!! price min:" + params[:price_min].to_s
      p "!!!!!!! bedrooms_min:" + params[:bedrooms_min].to_s
      p "!!!!!!! bedrooms_max:" + params[:bedrooms_max].to_s
      p "!!!!!!! bedrooms_exact:" + params[:bedrooms_exact].to_s

      # Base conditions for search; string
      conditions = 'lat < (?) AND lat > (?) AND lng < (?) AND lng > (?) AND
                    price_per_month >= (?) AND price_per_month <= (?)'
      # conditions = 'lat < (?) AND lat > (?) AND lng < (?) AND lng > (?) AND
      #               price_per_month > (?) AND price_per_month < (?) AND
      #               rooms > (?) AND rooms < (?)'
      params_array = [conditions, params[:north].to_f, params[:south].to_f, params[:east].to_f, params[:west].to_f,
        params[:price_min].to_f,  params[:price_max].to_f]

      if params[:bedrooms_exact]
        conditions.concat(' AND rooms = (?)')
        # params[:bedrooms_min].to_i, params[:bedrooms_max].to_i]
        params_array.push(params[:bedrooms_exact].to_i)
      else
        conditions.concat(' AND rooms >= (?)')
        conditions.concat(' AND rooms <= (?)')
        # params_array = [conditions, params[:north].to_f, params[:south].to_f, params[:east].to_f, params[:west].to_f,
        #   params[:price_min].to_f,  params[:price_max].to_f]
        params_array.push(params[:bedrooms_min].to_i)
        params_array.push(params[:bedrooms_max].to_i)
      end
      p "!!!!!!! conditions:" + conditions.to_s
      p "!!!!!!! params_array:" + params_array.to_s

      # parameters_for_conditions = params[:north].to_f, params[:south].to_f, params[:east].to_f, params[:west].to_f,
      #                             params[:price_min].to_f,  params[:price_max].to_f,
      #                             params[:bedrooms_min].to_i, params[:bedrooms_max].to_i, params[:bedrooms_exact].to_i

      @flats = Flat.where(params_array).includes(:images)
      # @flats = Flat.where('lat < (?) AND lat > (?) AND lng < (?) AND lng > (?) AND
      #                       price_per_month > (?) AND price_per_month < (?) AND
      #                       rooms > (?) AND rooms < (?) AND rooms = (?)',
      #                         params[:north].to_f, params[:south].to_f, params[:east].to_f, params[:west].to_f,
      #                         params[:price_min].to_f,  params[:price_max].to_f,
      #                         params[:bedrooms_min].to_i, params[:bedrooms_max].to_i, params[:bedrooms_exact].to_i
      #                         ).includes(:images)

      # @flats.where("params[:bedrooms_exact].to_i = ?", params[:bedrooms_exact].to_i) unless params[:bedrooms_exact].to_i.nil?
      # @flats = Flat.where('lat < (?) AND lat > (?) AND lng < (?) AND lng > (?)', params[:north].to_f, params[:south].to_f, params[:east].to_f, params[:west].to_f).includes(:images)
      unless @flats.empty?
        reviewsArray = get_reviews_for_flats(@flats)
        flats_serializer = parse_json @flats
        review_serializer = parse_json reviewsArray
        json_response "Indexed flats within area successfully", true, {flats: flats_serializer, reviews: review_serializer}, :ok
      else
        json_response "There were no flats with the search parameters", true, {flats: []}, :ok
      end
    else
      @flats = []
      # reviewsArray = get_reviews_for_flats(@flats)
      # does not need includes; flat_serializer has_many images and bookings will fetch both
      # @flats = Flat.all.includes(:images)
      # flats_serializer = parse_json @flats
      # review_serializer = parse_json reviewsArray
      json_response "You did not provide the right parameters", true, {flats: []}, :ok
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
      # p "flats_controller, amenity_params" + amenity_params.to_s
      amenity = Amenity.new amenity_params
      amenity.flat_id = flat.id
      # p "flats_controller, amenities after new" + amenity.flat_id.to_s
      if amenity.save
        flat_serializer = parse_json flat
        amenity_serializer = parse_json amenity
        json_response "Created flat succesfully", true, {flat: flat_serializer}, :ok
      else
        flat.destroy
        json_response "Create flat failed because amenity failed to be created", false, {}, :unprocessable_entity
      end
    else
      json_response "Create flat failed", false, {}, :unprocessable_entity
    end
  end

  def edit
  end

  def update
    # p "flats_controller, flat_params.empty?" + flat_params.empty?

      # p "flats_controller, flat_params" + flat_params.to_s
      if @flat.update flat_params
        if @amenity.update amenity_params
          flat_serializer = parse_json @flat
          amenity_serializer = parse_json @amenity
          json_response "Updated flat succesfully", true, {flat: flat_serializer }, :ok
        else
          json_response "Update flat failed", false, {}, :unprocessable_entity
        end
        # flat_serializer = parse_json @flat
        # json_response "Updated flat succesfully", true, {flat: flat_serializer }, :ok
      else
        json_response "Update flat failed", false, {}, :unprocessable_entity
      end

    # if amenity_params
      # p "flats_controller, amenity_params" + amenity_params.to_s
      # if @amenity.update flat_params
      #   flat_serializer = parse_json @flat
      #   amenity_serializer = parse_json @amenity
      #   json_response "Updated flat succesfully", true, {flat: flat_serializer }, :ok
      # else
      #   json_response "Update flat failed", false, {}, :unprocessable_entity
      # end
    # end
  end

  # delete image from Cloudinary when deleting flat; Uses array of publicids in
  # flat_controller, destroy method to collect public ids if user = current_user,
  # then if flat.destroy then iterate through the public id array to destroy the images on Cloudinary
  def destroy
    # p current_user
    # p @flat
    if @flat.user_id = current_user.id
      image_array = []
      images = @flat.images
      images.each do |i|
       # p "FlatsController, destroy, images.each, i: " + i.to_s
      image_array << i.publicid
      end
      # p "FlatsController, destroy, image_array: " + image_array.to_s
      if @flat.destroy
        json_response "Deleted flat succesfully", true, {flat: @flat}, :ok
        image_array.each do |i|
          # p "FlatsController, destroy, images.each, i: " + i.to_s
          result = Cloudinary::Uploader.destroy(i);
          p "FlatsController, destroy, images.each, result: " + result.to_s
        end
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

  def load_amenity
    # front end gets params and sends it in fetchFlatFromParams
    @amenity = Amenity.find_by flat_id: @flat.id
    unless @amenity.present?
      json_response "Cannot find amenity", false, {}, :not_found
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
    :price_per_day, :price_per_month, :price_min, :price_max, :guests, :sales_point, :description, :rooms, :bedrooms_min, :bedrooms_max, :beds, :king_or_queen_bed, :flat_type, :bath, :intro, :cancellation, :smoking,
    :size, :size_min, :size_max, :balcony_size, :station, :minutes_to_station, :minutes_to_station_min, :minutes_to_station_max, :station1, :minutes_to_station1, :floor, :deposit, :key_money, :year_built, :construction, :management_fees, :fees, :parking_available, :parking_included, :parking_price, :school_district, :school_district1, :circle_no_marker)
  end

  def amenity_params
    #if any chnage in column names below, change in create and edit flat in front end!!!!!!!
    #:basic is there just to so amenity params do not boecome null and crash
    params.require(:amenity).permit(:basic, :auto_lock, :security_system, :wifi, :pocket_wifi, :wheelchair_accessible, :iron, :ac, :heater, :bath_essentials,
      :hot_water, :parking, :tv, :dvd_player, :sofa, :kitchen, :dining_table, :dish_washer, :washer, :dryer, :cooking_basics,
      :eating_utensils, :microwave, :refrigerator, :oven, :crib, :high_chair, :bath_tub, :washlet, :hairdryer, :fire_extinguisher, :lockbox,
      :elevator, :washer_dryer_area, :bath_toilet_separate, :shower_bath_separate, :front_desk, :top_floor, :corner_flat, :first_floor, :pets_allowed)
  end
  # work around to get reviews for flats since cannot get reviews in serializer
  def get_reviews_for_flats(flats)
    reviewsArray = []
    @flats.each do |flat|
      reviews = Review.where(flat_id: flat.id)
      reviews.each do |review|
        if review
        reviewsArray.push(review)
        end
      end
    end
    return reviewsArray
  end
end
