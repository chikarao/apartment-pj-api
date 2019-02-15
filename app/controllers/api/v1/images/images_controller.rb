class Api::V1::Images::ImagesController < ApplicationController
  #
  #This is for Logined User
  before_action :valid_token, only: [:upload, :destroy]
  before_action :authenticate_with_token, only: [:upload, :destroy]

  def upload
    # p 'You are in upload images'
    # data = image_params
    # p 'in images/images_controller, upload, data' + data.to_s
    unless params[:file].blank?
      uploaded_io = params[:file]
      uploaded_flat_id = params[:flatId]
      path = Rails.root.join("public/system/temp_files/images", uploaded_io.original_filename)
      # file_array = []
      # open file for writing in binary 
      File.open(path, 'wb') do |file|
        file.write(uploaded_io.read)
      end

      image = File.open(path)
      result = Cloudinary::Uploader.upload(image, options = {})
      # result = Cloudinary::Uploader.upload(image, options = {})

      # p 'in images/images_controller, upload, image: ' + image.to_s
      # p 'in images/images_controller, upload cloudinary upload, result: ' + result['public_id']
      # p 'in images/images_controller, upload cloudinary upload, flat_id: ' +   uploaded_flat_id
      if result
        json_response "Uploaded image successfully", true, {response: result}, :ok
        File.delete(path)
      else
        json_response "Uploadd image failed", false, {}, :unprocessable_entity
      end
   end
   # end of unless
  end

  def destroy
    # flat_image-1526697489-0
    image_to_destroy = image_params[:publicid]
    p 'in images/images_controller, upload cloudinary upload, flat_id: ' + image_to_destroy
    # cloudinary.uploader.destroy(image, function(result) { console.log(result) });
    # p 'You are in destory images'
    # response = {data: 'hello'}
    result = Cloudinary::Uploader.destroy(image_to_destroy);
    json_response "Deleted image successfully", true, {response: result}, :ok
  end

  private

  def image_params
    params.require(:image).permit(:publicid)
  end

  # def load_flat
  #   # front end gets params and sends it in fetchFlatFromParams
  #   @flat = Flat.find_by id: params[:flat_id]
  #   unless @flat.present?
  #     json_response "Cannot find flat", false, {}, :not_found
  #   end
  # end

  def valid_token
    @user = User.find_by authentication_token: request.headers["AUTH-TOKEN"]
    if @user
      return @user
    else
      json_response "Invalid token", false, {}, :failure
    end
  end
end
