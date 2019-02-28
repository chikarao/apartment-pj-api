class Api::V1::StaffsController < ApplicationController
  # before_action :load_flat, only: :show
  before_action :load_staff, only: [:destroy, :update]
  before_action :valid_token, only: [:destroy, :update, :create]

  def index
    contractor = Contractor.where(user_id: @user.id)
    staffs = Staff.where(contractor_id: contractor[0].id)
    unless staffs.empty?
      # @flat.save
      staff_serializer = parse_json staffs
      # bank_account_serializer = parse_json @bank_account
      json_response "Indexed staffs succesfully", true, {staffs: staff_serializer}, :ok
    else
      json_response "There are no staffs associated with that contractor", true, {staffs: []}, :ok
      # json_response "Indexed bank_account failed", false, {}, :unprocessable_entity
    end
  end

  def show
  end

  def new
  end

  def create
    staff = Staff.new staff_params
    staff.contractor_id = staff_params[:contractor_id]
    staff.created_at = DateTime.now
    # only if have parent
    # staff.book_id = params[:book_id]
    if staff.save
      user_serializer = parse_json @user
      staff_serializer = parse_json staff
      json_response "Created staff succesfully", true, {staff: staff_serializer, user: user_serializer}, :ok
    else
      json_response "Create staff failed", false, {}, :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @staff.update staff_params
      user_serializer = parse_json @user
      staff_serializer = parse_json @staff
      json_response "Updated staff succesfully", true, {staff: staff_serializer, user: user_serializer}, :ok
    else
      json_response "Updated staff failed", false, {}, :unprocessable_entity
    end
  end

  def destroy
    if @user.id = current_user.id
      associated_staffs = []
      if !@staff.base_record_id
        associated_staffs = Staff.where(base_record_id: @staff.id)
      end

      if @staff.destroy && (associated_staffs.length > 0 ? associated_staffs.destroy_all : true)
        user_serializer = parse_json @user
        json_response "Deleted staff successfully", true, {user: user_serializer}, :ok
      else
        json_response "Delete staff failed", false, {}, :unprocessable_entity
      end
    else
      json_response "Delete staff failed", false, {}, :unprocessable_entity
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

  def staff_params
    params.require(:staff).permit(
      :contractor_id,
      :user_id,
      :first_name,
      :last_name,
      :identification,
      :tax_identification,
      :birthday,
      :title,
      :division,
      :group,
      :representative,
      :manager,
      :salary,
      :bonus,
      :bonus_months,
      :contract,
      :registration,
      :registration_type,
      :stamp,
      :mobile,
      :phone,
      :fax,
      :email,
      :line,
      :lat,
      :lng,
      :location_name,
      :location_number,
      :address1,
      :address2,
      :city,
      :state,
      :zip,
      :region,
      :country,
      :calendar,
      :language_code,
      :base_record_id,
      :registration_jurisdiction,
      :registration_number,
      :staff_number,
      :registration_jurisdiction
    )
  end

  def load_staff
    # front end gets params and sends it in fetchFlatFromParams
    @staff = Staff.find_by id: params[:id]
    unless @staff.present?
      json_response "Cannot find staff", false, {}, :not_found
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
