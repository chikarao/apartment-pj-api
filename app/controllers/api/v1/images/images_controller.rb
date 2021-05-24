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
      p "in images, upload, params[:file]: " + params[:file].to_s

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
      p "in images, upload, result: " + result.to_s
      # result = Cloudinary::Uploader.upload(image, options = {})

      # p 'in images/images_controller, upload, image: ' + image.to_s
      # p 'in images/images_controller, upload cloudinary upload, result: ' + result.to_s
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

  def upload_for_flat
    # p 'You are in upload_for_flat images'
    image_file_id_array = []
    params.each do |each_params|
      split_params = each_params.split('-')
      image_file_id_array.push(split_params[1]) if split_params[0] == 'file'
    end # end of each
    # if there are any ids in the array, go through and create images
    # path = nil
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
          image = Image.new(publicid: result["public_id"], flat_id: params["flat_id"])
          # delete file so does not remain in temp directory
          File.delete(path) if path
          unless image.save
            json_response "Create image failed because image failed to be created", false, {}, :unprocessable_entity
          end
        else
          json_response "Create image failed because image failed to be uploaded", false, {}, :unprocessable_entity
          File.delete(path) if path
        end # end of if result
      end # end of each image_file_id_array
    end #end of image_file_id_array.length > 0
   flat = Flat.find_by(id: params["flat_id"])
   flat_serializer = parse_json flat
   json_response "Uploaded and created image(s) succesfully", true, {flat: flat_serializer}, :ok
   # File.delete(path) if path
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

  def destroy_images
    if !params[:destroy_image_array].empty? && params[:flat_id]
      num_images = params[:destroy_image_array].length
      count = 0
      flat = Flat.find_by(id: params[:flat_id])

      params[:destroy_image_array].each do |each_image_id|
        image = Image.find_by(id: each_image_id)
        if image.destroy
          count = count + 1
          result = Cloudinary::Uploader.destroy(image.publicid)
        else
          json_response "Delete image failed", false, {}, :unprocessable_entity
        end #end unless image.destroy
      end # end params[:destroy_image_array].each do |each_image_id|
    else # else if !params[:destroy_image_array].empty?
      json_response "Delete image failed", false, {}, :unprocessable_entity
    end # else if !params[:destroy_image_array].empty?

    if count > 0
      flat_serializer = parse_json flat
      json_response "Deleted images succesfully", true, {flat: flat_serializer}, :ok
    else
      json_response "Delete images failed", false, {}, :unprocessable_entity
    end
  end #def destroy_images


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
