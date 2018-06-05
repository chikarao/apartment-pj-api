class Api::V1::LikesController < ApplicationController
  before_action :load_flat, only: :show
  before_action :valid_token, only: [:destroy, :create]
  before_action :authenticate_with_token, only: [:create, :update, :destroy]
  before_action :load_like, only: [:destroy]

  def index
  end

  def show
  end

  def new
  end

  def create
    like = Like.new like_params
    # like.flat_id = like_params[:flat_id]
    like.user_id = @user.id
    if like.save
      like_serializer = parse_json like
      json_response "Created like succesfully", true, {like: like_serializer}, :ok
    else
      json_response "Create like failed", false, {}, :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
    p "likes controller, @like: " + @like.to_s
    if @user.id = current_user.id
      if @like.destroy
        json_response "Deleted like succesfully", true, {like: @like}, :ok
      else
        json_response "Delete like failed", false, {}, :unprocessable_entity
      end
    else
      json_response "Delete like failed", false, {}, :unprocessable_entity
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

  def like_params
    params.require(:like).permit(:flat_id)
  end

  def load_like
    # front end gets params and sends it in fetchFlatFromParams
    @like = Like.find_by(flat_id: params[:id], user_id: @user.id)
    unless @like.present?
      json_response "Cannot find like", false, {}, :not_found
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
