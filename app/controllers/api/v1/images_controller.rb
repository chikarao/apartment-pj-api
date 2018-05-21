class Api::V1::ImagesController < ApplicationController
  before_action :load_flat, only: :show
  before_action :load_image, only: :destroy
  before_action :valid_token, only: [:destroy, :create]

  def index
  end

  def show
  end

  def new
  end

  def create
    image = Image.new image_params
    image.flat_id = params[:flat_id]
    image.created_at = DateTime.now
    # only if have parent
    # image.book_id = params[:book_id]
    if image.save
      image_serializer = parse_json image

      json_response "Created image succesfully", true, {image: image_serializer}, :ok
    else
      json_response "Create image failed", false, {}, :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
    if @user.id = current_user.id
      #delete the image on cloudinary too
      publicid= @image.publicid
      if @image.destroy
        result = Cloudinary::Uploader.destroy(publicid)
        json_response "Deleted image succesfully", true, {image: @image, cloudinary_result: result}, :ok
        json_response "Deleted image succesfully", true, {image: @image}, :ok
      else
        json_response "Delete image failed", false, {}, :unprocessable_entity
      end
    else
      json_response "Delete image failed", false, {}, :unprocessable_entity
    end
  end

  private

  def load_flat
    # front end gets params and sends it in fetchFlatFromParams
    @flat = Flat.find_by id: params[:flat_id]
    unless @flat.present?
      json_response "Cannot find flat", false, {}, :not_found
    end
  end

  def image_params
    params.require(:image).permit(:flat_id, :publicid)
  end

  def load_image
    # front end gets params and sends it in fetchFlatFromParams
    @image = Image.find_by id: params[:id]
    unless @image.present?
      json_response "Cannot find image", false, {}, :not_found
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
