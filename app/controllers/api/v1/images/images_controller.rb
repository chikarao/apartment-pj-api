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
        file_array = []
        File.open(path, 'wb') do |file|
          file.write(uploaded_io.read)
        end

        image = File.open(path)
        result = Cloudinary::Uploader.upload(image, options = {})

        p 'in images/images_controller, upload, image: ' + image.to_s
        p 'in images/images_controller, upload cloudinary upload, result: ' + result['public_id']
        p 'in images/images_controller, upload cloudinary upload, flat_id: ' +   uploaded_flat_id
        if result
          json_response "Uploaded image successfully", true, {response: result}, :ok
          File.delete(path)
        else
          json_response "Uploadd image failed", false, {}, :unprocessable_entity
        end


        # image = Image.new
        # # image.user_id = @user.id
        # image.flat_id = uploaded_flat_id
        # image.publicid = result['public_id']
        # if image.save
        #   json_response "Uploaded image successfully", true, {response: image}, :ok
        #   File.delete(path)
        # else
        #   json_response "Create image failed", false, {}, :unprocessable_entity
        # end
        # if ExampleModel.create(image: Rails.root.join('public', path.to_s.split('/public/')[1]).open))
        #   File.delete(path)
        # end
      # end
   end
   # end of unless
    # data = {data: 'hello'}
  end

  def destroy
    # p 'You are in destory images'
    response = {data: 'hello'}
    json_response "Deleted image successfully", true, {response: 'publicid'}, :ok
  end

  private

  def image_params
    params
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
