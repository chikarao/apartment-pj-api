require 'json'
require 'uri'
require 'net/http'
# UserStatus in concerns/user_status for creating and upding redis hash
# https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key=YOUR_API_KEY

class Api::V1::FlatsController < ApplicationController
  # include ::UserStatus
  before_action :load_flat, only: [:show, :update, :destroy]
  before_action :load_amenity, only: [:update]
  # TAKE out index from valid_token; In there just for experiment
  before_action :valid_token, only: [:create, :update, :destroy]
  before_action :authenticate_with_token, only: [:create, :update, :destroy]
  def index
    # this is for fetchFlats in front end
    p "************************ params in Flats controller index, params" + params.to_s
    # cached_flats = $redis.get('flats')
    # cached_flat_buildings = $redis.get('flat_buildings')


    # unless cached_flats && cached_flat_buildings
    if params[:east] && params[:west] && params[:north] && params[:south]

      # Base conditions for search; string
      # base_conditions = 'lat < (?) AND lat > (?) AND lng < (?) AND lng > (?) AND
      #               price_per_month >= (?) AND price_per_month <= (?) AND
      #               size >= (?) AND size <= (?) AND
      #               minutes_to_station >= (?) AND minutes_to_station <= (?) AND date_start >= (?) AND date_end <= (?) AND booking_by_owner = (?)'
      base_conditions = 'lat < (?) AND lat > (?) AND lng < (?) AND lng > (?) AND price_per_month >= (?) AND price_per_month <= (?) AND size >= (?) AND size <= (?) AND minutes_to_station >= (?) AND minutes_to_station <= (?)'
      # params to pass into query
      params_array = [base_conditions , params[:north].to_f, params[:south].to_f, params[:east].to_f, params[:west].to_f,
        params[:price_min].to_f,  params[:price_max].to_f,
        params[:size_min].to_f,  params[:size_max].to_f,
        params[:station_min].to_f,  params[:station_max].to_f]
      # params_array = [base_conditions , params[:north].to_f, params[:south].to_f, params[:east].to_f, params[:west].to_f,
      #   params[:price_min].to_f,  params[:price_max].to_f,
      #   params[:size_min].to_f,  params[:size_max].to_f,
      #   params[:station_min].to_f,  params[:station_max].to_f]
      # if bedroom exact number is passed, add to base_conditions and params_array
      if params[:bedrooms_exact]
        base_conditions.concat(' AND rooms = (?)')
        params_array.push(params[:bedrooms_exact].to_i)
      else
        # else add range for bedrooms
        base_conditions.concat(' AND rooms >= (?)')
        base_conditions.concat(' AND rooms <= (?)')
        params_array.push(params[:bedrooms_min].to_i)
        params_array.push(params[:bedrooms_max].to_i)
      end
      # get amenity column names array ready to iterate through
      amenity_columns = Amenity.column_names
      # iterate through each and get the boolean value of each amenity
      amenity_columns.each do |a|
        params_string_value = params[a].to_s
        # if true add to base conditions and to params array to add to search
        if params_string_value == "true"
          base_conditions.concat(" AND #{a} = (?)")
          params_value = true
          params_array.push(params_value)
        end
      end

      # no bookings
      # base_conditions.concat(' AND bookings.id = (?)')
      # params_array.push('NULL')
      booking_base_conditions = ''
      booking_params_array = [booking_base_conditions]

      if params[:date_start] && params[:date_end]
        # startDate = Date.parse("2018-11-1")
        # endDate = Date.parse("2018-11-7")
        # startDate = Date.parse("2018-10-1")
        # endDate = Date.parse("2018-10-8")
        startDate = Date.parse(params[:date_start])
        endDate = Date.parse(params[:date_end])
        booking_base_conditions.concat("(date_start BETWEEN (?) AND (?)) OR (date_end BETWEEN (?) AND (?)) OR ((?) BETWEEN date_start AND date_end) OR ((?) BETWEEN date_start AND date_end)")

        booking_params_array.push(startDate)
        booking_params_array.push(endDate)
        booking_params_array.push(startDate)
        booking_params_array.push(endDate)
        booking_params_array.push(startDate)
        booking_params_array.push(endDate)
        # get flats joining amenity and booking exluding flat which have booking that meet conditions
        # @flats = Flat.left_joins(:amenity, :bookings).where(params_array).where.not(id: Booking.select('DISTINCT flat_id').where(booking_params_array))
        # p '!!!!!!!!!params_array' + params_array.to_s
        @flats = Flat.left_joins(:amenity, :bookings).where(params_array).where.not(id: Booking.select('DISTINCT flat_id').where(booking_params_array)).uniq
      else
        #if no date params, no booking conditions
        @flats = Flat.left_joins(:amenity).where(params_array).uniq
      end

      # call query joining amennity and passing array with base_conditions and params
      # @flats = Flat.joins(:amenity, :booking).where(params_array)
      # original query
      # @flats = Flat.joins(:amenity, :bookings).where(params_array).where.not(booking_params_array)
      # @flats = Flat.joins(:amenity, :bookings).where(params_array).where.not("(bookings.date_start OR bookings.date_end) BETWEEN (?) AND (?)", startDate, endDate )
      # @flats = Flat.joins(:amenity, :bookings).where(params_array).where.not("(date_start BETWEEN (?) AND (?)) OR (date_start BETWEEN (?) AND (?)) OR (((?) OR (?)) BETWEEN date_start AND date_end)", startDate, endDate, startDate, endDate, startDate, endDate)
      # @flats = Flat.left_outer_joins(:amenity, :bookings).where(params_array).where.not("(date_start BETWEEN (?) AND (?)) OR (date_end BETWEEN (?) AND (?)) OR (((?) OR (?)) BETWEEN date_start AND date_end)", startDate, endDate, startDate, endDate, startDate, endDate)
      # @flats = Flat.joins(:amenity, :bookings).where(params_array).where.not("date_start = (?)", startDate)
      # @flats = Flat.left_outer_joins(:amenity).where(params_array).where.not(id: Booking.select('DISTINCT flat_id').where("date_start = (?)", startDate)
      # p "!!!!!!!!flats_controller, index, date_range: " + date_range.to_s
      # same as below
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
        # unless flats are empty call private method get_reviews_for_flats, sericalize and send response
        flat_buildings = get_flats_in_same_building_array(@flats)
        reviewsArray = get_reviews_for_flats(@flats)
        flats_serializer = parse_json @flats

        # p "*************cached flats class name: " + cached_flats.class.name.to_s
        # json_response converts to json so parse json the value in redis key
        $redis.set('flats', flats_serializer.to_json)
        $redis.set('flat_buildings', flat_buildings.to_json)
        # $redis.hmset('user_status:1,1;2', 'last_activity', 12345678)


        all = $redis.keys(pattern = '*')
        flat_bldgs = $redis.keys(pattern = 'flat_*')
        user_key = $redis.keys(pattern = '*:1*')
        # user_last_activity = $redis.hgetall(user_key)
        # user = User.first
        # set_function = set_last_user_activity(user)
        # p "*************redis all keys: " + all.to_s
        # p "*************redis user_key: " + user_key.to_s
        # p "*************redis user_last_activity: " + user_last_activity.to_s
        # p "*************cached flats class name to string: " + cached_flats.to_s
        # p "*************cached flats class name as is: " + cached_flats
        # redis set takes a string so flat_serializer which is an array converted to json
        # flats_in_buildings_serializer = parse_json buildings_with_multiple_flats.flats_with_building_siblings
        # flats__buildings_serializer = parse_json buildings_with_multiple_flats.flats_no_building_siblings
        # p "!!!!! buildings_with_multiple_flats" + buildings_with_multiple_flats.to_s
        review_serializer = parse_json reviewsArray
        # json_response "Indexed flats within area successfully", true, {flats: flats_serializer, reviews: review_serializer}, :ok
        json_response "Indexed flats within area successfully", true, {flats: flats_serializer, reviews: review_serializer, flat_buildings: flat_buildings}, :ok
      else
        json_response "There were no flats with the search parameters", true, {flats: []}, :ok
      end
    else
      # else for if latlng params
      @flats = []
      # does not need includes; flat_serializer has_many images and bookings and will fetch both
      json_response "You did not provide the right parameters", true, {flats: []}, :ok
    end
    # KEEP for Redis
  # else

  #   json_response "Indexed flats within area successfully", true, {flats: JSON.parse(cached_flats), reviews: review_serializer, flat_buildings: JSON.parse(cached_flat_buildings)}, :ok
  # end
  end

  def show
    #this is for show_flats in front end
    flat_serializer = parse_json @flat
    # p "*************flats#show, @user: " + @user.id.to_s

    user_status_hash = nil
    if $redis
      user_status_hash = get_user_status_by_user_id(@flat.user_id)
      # p "*************redis flats#show, user_status_hash: " + user_status_hash.to_s
      if !user_status_hash
        user_status_hash = set_last_user_activity({user_id: @flat.user_id, logged_in: false, online: false, keep_online_status: false})
      end
      # user_status = $redis.keys(pattern = "*:#{@flat.user_id},*")
      # last_activity = $redis.hget(user_status[0], "last_activity").to_i
      # logged_in = user_status[0][user_status[0].index(',') + 1].to_i;
      # p "*************redis flats#show, logged_in: " + logged_in.to_s
      # online = user_status[0][user_status[0].index(';') + 1].to_i;
      # p "*************redis flats#show, online: " + online.to_s
      # user_status_hash = {user_id: @flat.user_id, logged_in: logged_in, online: online, last_activity: last_activity}
    end
    json_response "Showed flat successfully", true, {flat: flat_serializer, user_status: [user_status_hash]}, :ok
  end

  def new
  end

  # def create
  #   flat = Flat.new flat_params
  #   flat.user_id = @user.id
  #   flat.created_at = DateTime.now
  #   # only if have parent
  #   # flat.book_id = params[:book_id]
  #   if flat.save
  #     # p "flats_controller, amenity_params" + amenity_params.to_s
  #     amenity = Amenity.new amenity_params
  #     amenity.flat_id = flat.id
  #     # p "flats_controller, amenities after new" + amenity.flat_id.to_s
  #     if amenity.save
  #       flat_serializer = parse_json flat
  #       amenity_serializer = parse_json amenity
  #       json_response "Created flat succesfully", true, {flat: flat_serializer}, :ok
  #     else
  #       flat.destroy
  #       json_response "Create flat failed because amenity failed to be created", false, {}, :unprocessable_entity
  #     end
  #   else
  #     json_response "Create flat failed", false, {}, :unprocessable_entity
  #   end
  # end

  def create
    # IMPORTANT: The Create endpoint performs 3 actions:
    # 1) geocode from user inputted address using gmaps;
    # 2) image upload to cloudinary;
    # 3) Create and persist instances of flat, amenity and images
    # if all three go without errors, return success else if any fail, return error

    # Get geocode lat lng from google maps api
    api_key = ENV["GOOGLE_MAP_API_KEY"]
    # https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key=YOUR_API_KEY
    city = flat_params[:city]
    state = flat_params[:state]
    zip = flat_params[:zip]
    country = flat_params[:country]
    address_string = "#{flat_params[:address1]},+#{flat_params[:city]},+#{flat_params[:state]},+#{flat_params[:zip]},+#{flat_params[:country]}}"
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{address_string}&key=#{api_key}"
    url = URI.parse(URI.escape(url))
    response = Net::HTTP.get(url)

    parsedResponse = response["results"].empty? ? null : JSON.parse(response)
    # if gmaps api sends back a result, create a flat
    if parsedResponse
      # p "in flats, create, params: " + params
      # p "in flats, create, params, parsedResponse: " + params.to_s + ' ' + parsedResponse.to_s
      # p "in flats, create, flat_params, amenity_params: " + flat_params.to_s + amenity_params.to_s
      flat = Flat.new flat_params
      flat.user_id = @user.id
      flat.created_at = DateTime.now
      flat.lat = parsedResponse["results"][0]["geometry"]["location"]["lat"]
      flat.lng = parsedResponse["results"][0]["geometry"]["location"]["lng"]
      if flat.save
        # if flat is saved create an amenity instance
        amenity = Amenity.new amenity_params
        amenity.flat_id = flat.id
        # if amenity is not save, return error
        unless amenity.save
          flat.destroy
          json_response "Create flat failed because amenity failed to be created", false, {}, :unprocessable_entity
        end
        # if flat and amenity is saved successfully, create and persist images
        # Logic for images
        image_file_id_array = []
        # image data is send in a multipart/form data that is wrapped by ApplicationController to
        # produce an actiondispatch object; access the files using params
        # the params keys for images are named 'file-0' and can be multiple so push the ids (integers) into array to iterate
        params.each do |each_params|
          split_params = each_params.split('-')
          image_file_id_array.push(split_params[1]) if split_params[0] == 'file'
        end # end of each
        # if there are any ids in the array, go through and create images
        if image_file_id_array.length > 0
          image_file_id_array.each do |each_image_id|
            uploaded_io = params["file-#{each_image_id}"]
            path = Rails.root.join("public/system/temp_files/images", uploaded_io.original_filename)
            # open file for writing in binary
            File.open(path, 'wb') do |file|
              file.write(uploaded_io.read)
            end

            image = File.open(path)
            result = Cloudinary::Uploader.upload(image, options = {})
            # If cloudinary returns a result hash, create and persist image instance
            if result
              # delete file so does not remin in templ directory
              File.delete(path) if path
              image_instance = Image.new(publicid: result["public_id"], flat_id: flat.id)
              unless image_instance.save
                flat.destroy
                json_response "Create flat failed because image failed to be created", false, {}, :unprocessable_entity
              end
            else
              File.delete(path) if path
              flat.destroy
              json_response "Create flat failed because image failed to be uploaded", false, {}, :unprocessable_entity
            end # end of if result
          end # end of each image_file_id_array
          flat_serializer = parse_json flat
          amenity_serializer = parse_json amenity
          json_response "Created flat succesfully", true, {flat: flat_serializer}, :ok
        end #end of image_file_id_array.length > 0

      else # else for flat.save
        json_response "Create flat failed; could not save flat", false, {}, :unprocessable_entity
      end # end for flat.save
    else # if parsedResponse
      json_response "Create flat failed; could not get geocode coordinates from address; please check address", false, {}, :unprocessable_entity
    end # if parsedResponse
  end

  def edit
  end

  def get_google_map_bounds_keys
    # Record of key changes by google api
    # change from b.f f.f to j.l and l.l
    # changed again 12/12/18 to ea.l and j and la.l and j
    # changed again 12/26/18 to fa.l and j ma.l and j
    # changed again 1/16/19 to ga.l and j ma.l and j
    # changed yet again 4/19 to ia.l and j, na.l and j
    # changed yet again 7/24 to ga.l and j, na.l and j what for????
    # changed yet again 12/17/2019 or before to ka.h, ka.g, pa.h, pa.g
    # changed yet again 1/16/2020 to Ya.i, Ya.g, Ta.i, Ya.g
    # changed yet again 1/17/2020 to pa.h, pa.g, ka.h, ka.g
    # changed yet again 1/24/2020 back to Ya.i, Ya.g, Ta.i, Ya.g
    # changed yet again 5/21/2020 back to Ya.i, Ya.j, Ua.i, Ua.j
    # changed yet again 6/30/2020 back to Za.i, Za.j, Ua.i, Ua.j
    north_south_first = 'Za'
    south_second = 'i' # 37.73223256302308
    north_second = 'j' # larger positive in SF, California 37.835340869420385
    east_west_first = 'Ua'
    west_second = 'i' # larger negative -122.50212027587891
    east_second = 'j' # -122.25149466552
    # Sample bounds logs from Googlemap API for illustration
    # 1/24/20
    # north_second is the larger number of 37....
    # west_second is the larger NEGATIVE of -122....
    #   Ya: he {g: 37.74363581410171, i: 37.84672822108214}
    #   Ta: de {g: -122.52821280517578, i: -122.27758719482422}

    #     north: 37.84672822108214
    #     south: 37.74363581410171
    #     east: -122.27758719482422
    #     west: -122.52821280517578

    google_map_bounds_keys = {
      north_south_first: north_south_first,
      north_second: north_second,
      south_second: south_second,
      east_west_first: east_west_first,
      east_second: east_second,
      west_second: west_second
    }

    json_response "Received google map bounds keys successfully", true, google_map_bounds_keys, :ok
  end

  def update
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
        json_response "Deleted flat succesfully", true, {}, :ok
        image_array.each do |i|
          # p "FlatsController, destroy, images.each, i: " + i.to_s
          result = Cloudinary::Uploader.destroy(i);
          # p "FlatsController, destroy, images.each, result: " + result.to_s
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
    :price_per_day, :price_per_month, :price_min, :price_max, :guests, :sales_point, :description, :rooms, :bedrooms_min,
    :bedrooms_max, :beds, :king_or_queen_bed, :flat_type, :bath, :intro, :cancellation, :smoking,
    :size, :floor_area_official, :size_min, :size_max, :balcony_size, :station, :minutes_to_station, :minutes_to_station_min, :minutes_to_station_max,
    :station1, :minutes_to_station1, :floor, :deposit, :key_money, :year_built, :construction, :management_fees, :fees,
    :parking_available, :parking_included, :parking_price, :bicycle_parking_included, :storage_included, :motorcycle_parking_included, :dedicated_yard,
    :school_district, :school_district1, :circle_no_marker, :ical_import_url, :layout, :balcony_size, :toilet, :building_id, :unit, :language_code, :payment_due_date, :bank_account_id,
    :transfer_fee_paid_by, :rent_payment_method, :management_fee_due_date, :owner_name, :owner_contact_name, :owner_address, :owner_phone, :ownership_rights,
    :other_rights)
  end

  def amenity_params
    #if any chnage in column names below, change in create and edit flat in front end!!!!!!!
    #:basic is there just to so amenity params do not boecome null and crash
    params.require(:amenity).permit(:basic, :flat_id, :auto_lock, :security_system, :wifi, :pocket_wifi, :wheelchair_accessible, :iron, :ac, :heater, :bath_essentials,
      :hot_water, :parking, :tv, :dvd_player, :sofa, :kitchen, :dining_table, :dish_washer, :washer, :dryer, :cooking_basics,
      :eating_utensils, :microwave, :refrigerator, :oven, :crib, :high_chair, :bath_tub, :washlet, :hairdryer, :fire_extinguisher, :lockbox,
      :elevator, :washer_dryer_area, :bath_toilet_separate, :shower_bath_separate, :front_desk, :top_floor, :corner_flat, :first_floor, :pets_allowed, :shower,
      :wash_basin, :kitchen_grill, :lighting_fixed, :internet_ready, :mail_box, :parcel_delivery_box, :lock_key, :cable_tv)
  end

  def get_flats_in_same_building_array(flats)
    # p "!!!!!! flats serialized: " + flats.to_s
    array = []
    building_hash = {}
    building_hash_id = {}
    flat_with_building_all = []
    flat_with_building_all_id = []
    buildings_id = []
    flats_no_building = []
    flat_no_building_all = []
    flat_no_building_all_id = []
    flats_no_building_serialized = []

    # create building_hash with flat and one with flat id for processing in google map cdu
    flats.each do |eachFlat|
      if building_hash[eachFlat.building_id]
        building_hash[eachFlat.building_id].push(eachFlat)
        building_hash_id[eachFlat.building_id].push(eachFlat.id)
      elsif eachFlat.building_id && eachFlat.building_id != nil
        building_hash[eachFlat.building_id] = [eachFlat]
        building_hash_id[eachFlat.building_id] = [eachFlat.id]
      end
    end
    # delete key values with null building_id, take out flats with same building from flats,
    # serialize building_hash
    building_hash.keys.each do |eachKey|
      # if hash key has value of array of less than one flat, delete the key
      if building_hash[eachKey].length > 1
        # put all flats with buildings in array to filter reject below
        building_hash[eachKey].each do |each|
          flat_with_building_all.push(each)
          flat_with_building_all_id.push(each.id)
        end
        # serialize building_hash here since the value is an array
        buildings_id.push(eachKey);
        building_hash[eachKey] = parse_json building_hash[eachKey].uniq
      else
        # if building has only one or fewer flats, delete key
        building_hash.delete(eachKey)
        building_hash_id.delete(eachKey)
      end
    end

    # if key has array of more than one flat, take out that flat from flat results
    if flat_with_building_all.length > 0
      flats_no_building = flats.reject {|flat| flat_with_building_all.include?(flat)}
    end
    # p "!!!!!!!flats_no_building: " + flats_no_building.to_s
    # check if building_hash is empty and if empty, return just all flats serialized
    unless building_hash.empty?
      # serialize flats with out the flats with same building
      flats_no_building_serialized = parse_json flats_no_building
      flats_no_building_id = flats_no_building.map {|each| each.id}
    else
      flats_no_building_serialized = parse_json flats
      flats_no_building_id = flats.map {|each| each.id}
    end

    return {buildings_with_flats: building_hash, buildings_with_flats_id: building_hash_id, buildings_just_id: buildings_id, buildings_with_flats_just_id: flat_with_building_all_id, flats_no_building: flats_no_building_serialized, flats_no_building_id: flats_no_building_id}
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
