class Api::V1::Reviews::ReviewsController < ApplicationController
  #
  #This is for Logined User
  before_action :valid_token, only: [:index, :reviews_for_flat, :review_for_booking_by_type]
  # before_action :authenticate_with_token, only: []

  def index
    # # p 'in reviews, BookingsController'
    # @reviews = Conversation.where(user_id: @user.id)
    # # p @reviews
    # if @reviews
    #   reviews_serializer = parse_json @reviews
    #   json_response "Indexed user's reviews successfully", true, {reviews: reviews_serializer}, :ok
    # else
    #   json_response "Cannot find reviews for user", false, {}, :not_found
    # end
    # # @flat = Flat.order(created_at: :desc)
    # # @flat = policy_scope(Flat).order(created_at: :desc)
    #
    #  # authorize @cars
  end

  def reviews_for_flat
    p 'in reviews, ReviewsController, reviews_for_flat, reviews_params' + review_params.to_s
    @reviews = Review.where(flat_id: review_params[:flat_id])
    # p @reviews
    if @reviews
      reviews_serializer = parse_json @reviews
      json_response "Fetched reviews by flat successfully", true, {reviews: reviews_serializer}, :ok
    else
      json_response "Cannot find reviews for flat", false, {}, :not_found
    end
    # @flat = Flat.order(created_at: :desc)
    # @flat = policy_scope(Flat).order(created_at: :desc)

     # authorize @cars
  end

  def review_for_booking_by_user
    # p 'in reviews, ReviewsController, reviews_params: ' + reviews_params.to_s
    # p 'in reviews, ReviewsController, @user: ' + @user.to_s
    # Post.where('id = 1').or(Post.where('id = 2'))
    # reference: https://stackoverflow.com/questions/28954500/activerecord-where-field-array-of-possible-values
    @review = Review.where(booking_id: review_params[:booking_id], review_for_flat: true)

    # p 'in reviews, ReviewsController, reviews_by_user_and_flat, reviews_by_user: ' + @review.to_s

    # p @reviews
    if @review
      reviews_serializer = parse_json @review
      json_response "Fetched review for booking successfully", true, {review: reviews_serializer}, :ok
    else
      json_response "Cannot find review for flat", false, {}, :not_found
    end
    # @flat = Flat.order(created_at: :desc)
    # @flat = policy_scope(Flat).order(created_at: :desc)

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

  # reference for passing array in params https://jaketrent.com/post/permit-array-rails-strong-parameters/
  def review_params
    params.require(:review).permit(:booking_id, :flat_id, :review_for_flat, :review_for_user, :review_for_site)
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
