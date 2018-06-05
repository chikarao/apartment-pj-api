class Api::V1::Users::LikesController < ApplicationController
  #
  #This is for Logined User
  before_action :valid_token, only: [:index, :likes_by_flat, :likes_by_user]
  before_action :authenticate_with_token, only: [:index, :likes_by_flat, :likes_by_user]

  def index
    # p 'in users, BookingsController'
    @likes = Like.where(user_id: @user.id)
    # p @likes
    if @likes
      likes_serializer = parse_json @likes
      json_response "Indexed user's likes successfully", true, {likes: likes_serializer}, :ok
    else
      json_response "Cannot find likes for user", false, {}, :not_found
    end
    # @flat = Flat.order(created_at: :desc)
    # @flat = policy_scope(Flat).order(created_at: :desc)

     # authorize @cars
  end

  def likes_by_flat
    p 'in users, LikesController, like_params' + like_params.to_s
    @like = Like.where(flat_id: like_params[:flat_id])
    # p @like
    if @like
      like_serializer = parse_json @like
      json_response "Fetched likes by flat successfully", true, {like: like_serializer}, :ok
    else
      json_response "Cannot find like for flat", false, {}, :not_found
    end
    # @flat = Flat.order(created_at: :desc)
    # @flat = policy_scope(Flat).order(created_at: :desc)

     # authorize @cars
  end

  def likes_by_user
    # p 'in users, LikesController, like_params: ' + like_params.to_s
    # p 'in users, LikesController, @user: ' + @user.to_s
    # Post.where('id = 1').or(Post.where('id = 2'))
    # reference: https://stackoverflow.com/questions/28954500/activerecord-where-field-array-of-possible-values
    # @likes = Like.where(user_id: @user.id).or(Like.where(like_params[:flat_id_array]))
    @likes = Like.where(user_id: @user.id)
    p 'in users, LikesController, like_by_user_and_flat, likes_by_user: ' + @likes.to_s

    # p @like
    if @likes
      likes_serializer = parse_json @likes
      json_response "Fetched likes by user successfully", true, {likes: likes_serializer}, :ok
    else
      json_response "Cannot find likes for user", false, {}, :not_found
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
  def like_params
    params.require(:like).permit(:flat_id)
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
