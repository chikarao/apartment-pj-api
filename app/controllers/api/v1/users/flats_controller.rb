# require_dependency "application_controller"

class Api::V1::Users::FlatsController < ApplicationController
  # include ::AppLanguages
  #This is for Logined User
  before_action :valid_token, only: [:index]
  before_action :authenticate_with_token, only: [:index]
  # before_action :store_app_languages, only: [:index]

  def index
    # p 'in users, FlatsController @user.id' + @user.id.to_s
    @flats = Flat.where(user_id: @user.id).includes(:bookings, :images, :places)

    app_languages = AppLanguages::OBJECT
    # app_languages = DocumentResources.app_languages
    # app_languages = DocumentResources::APP_LANGUAGES
    # app_languages = @app_languages
    # p "In users/flats#index, DocumentResources::Object: " + DocumentResources::OBJECT.to_s
    # app_languages = DocumentResources::OBJECT
    # app_languages = {}
    # p @flats
    if @flats
      flats_serializer = parse_json @flats
      json_response "Indexed user's flats successfully", true, {flats: flats_serializer, app_languages: app_languages.to_json}, :ok
      # json_response "Indexed user's flats successfully", true, {flats: flats_serializer, app_languages: app_languages.to_json}, :ok
    else
      json_response "Cannot find flat for user", false, {}, :not_found
    end
    # @flat = Flat.order(created_at: :desc)
    # @flat = policy_scope(Flat).order(created_at: :desc)

     # authorize @cars
  end

  # def show
  #   @car = Car.find(params[:id])
  #
  #   @hash = Gmaps4rails.build_markers(@car) do |car, marker|
  #     marker.lat car.latitude
  #     marker.lng car.longitude
  #     # marker.infowindow render_to_string(partial: "/cars/map_box", locals: { car: car })
  #   end
  # end
  #
  #
  #
  # def create
  # end
  private

  def valid_token
    @user = User.find_by authentication_token: request.headers["AUTH-TOKEN"]
    p 'in users, FlatsController valid_token @user.id' + @user.id.to_s
    if @user
      return @user
    else
      json_response "Invalid token", false, {}, :failure
    end
  end

  # def store_app_languages
  #   @app_languages = AppLanguages::AppLanguagesClass::OBJECT
  # end
end
