class Api::V1::ContractorsController < ApplicationController
  # before_action :load_flat, only: :show
  before_action :load_contractor, only: [:destroy, :update]
  before_action :valid_token, only: [:destroy, :update, :create]

  def index
  end

  def show
  end

  def new
  end

  def create
    contractor = Contractor.new contractor_params
    contractor.user_id = @user.id
    contractor.created_at = DateTime.now
    # only if have parent
    # contractor.book_id = params[:book_id]
    if contractor.save
      contractor_serializer = parse_json contractor
      user_serializer = parse_json @user
      json_response "Created contractor succesfully", true, {contractor: contractor_serializer, user: user_serializer}, :ok
    else
      json_response "Create contractor failed", false, {}, :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @contractor.update(contractor_params)
      user_serializer = parse_json @user
      contractor_serializer = parse_json @contractor
      json_response "Updated contractor successfully", true, {contractor: contractor_serializer, user: user_serializer}, :ok
    else
      json_response "Updated contractor failed", false, {}, :unprocessable_entity
    end
  end

  def destroy
    if @user.id = current_user.id
      # if @contractor record is a base record; ie does not have base_record_id,
      #
      associated_contractors = []
      if !@contractor.base_record_id
        associated_contractors = Contractor.where(base_record_id: @contractor.id)
      end

      if @contractor.destroy && (associated_contractors.length > 0 ? associated_contractors.destroy_all : true)
        user_serializer = parse_json @user
        json_response "Deleted contractor succesfully", true, {contractor: @contractor, user: user_serializer}, :ok
      else
        json_response "Delete contractor failed", false, {}, :unprocessable_entity
      end
    else
      json_response "Delete contractor failed", false, {}, :unprocessable_entity
    end
  end

  private

  # def load_flat
  #   # front end gets params and sends it in fetchFlatFromParams
  #   @flat = Flat.find_by id: params[:flat_id]
  #   unless @flat.present?
  #     json_response "Cannot find flat", false, {}, :not_found
  #   end
  # end

  def contractor_params
    params.require(:contractor).permit(
      :user_id,
      :contractor_type,
      :contractor_sub_type,
      :contractor_sales_heading,
      :contractor_intro,
      :price,
      :price_range,
      :days_closed,
      :time_from,
      :time_to,
      :specialty,
      :phone,
      :mobile,
      :email,
      :company_name,
      :registration_number,
      :registration_type,
      :registration_date,
      :first_name,
      :last_name,
      :title,
      :stamp,
      :fax,
      :facebook,
      :twitter,
      :line,
      :image,
      :url,
      :lat,
      :lng,
      :address1,
      :address2,
      :city,
      :zip,
      :state,
      :region,
      :country,
      :language_code,
      :base_record_id,
      # jurisdiction is prefecture in japan
      :registration_jurisdiction,
      # grantor is governor or minister in japan
      :registration_grantor,
      :registration_number_front,

    )
  end

  def load_contractor
    # front end gets params and sends it in fetchFlatFromParams
    @contractor = Contractor.find_by id: params[:id]
    unless @contractor.present?
      json_response "Cannot find contractor", false, {}, :not_found
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
