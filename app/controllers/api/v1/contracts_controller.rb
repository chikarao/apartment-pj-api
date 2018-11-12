class Api::V1::ContractsController < ApplicationController
  # before_action :load_flat, only: :show
  before_action :load_contract, only: [:destroy, :update]
  before_action :valid_token, only: [:destroy, :update, :create]

  def index
  end

  def show
  end

  def new
  end

  def create
    contract = Contract.new contract_params
    flat = Flat.find_by(id: contract_params[:flat_id])
    contract.created_at = DateTime.now
    # only if have parent
    # contract.book_id = params[:book_id]
    if contract.save
      flat_serializer = parse_json flat
      contract_serializer = parse_json contract
      json_response "Created contract successfully", true, {contract: contract_serializer, flat: flat_serializer}, :ok
    else
      json_response "Create contract failed", false, {}, :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @contract.update contract_params
      flat = Flat.find_by(id: @contract.flat_id)
      flat_serializer = parse_json flat
      contract_serializer = parse_json @contract
      json_response "Updated contract succesfully", true, {contract: contract_serializer, flat: flat_serializer}, :ok
    else
      json_response "Updated contract failed", false, {}, :unprocessable_entity
    end
  end

  def destroy
    if @user.id = current_user.id
      flat = Flat.find_by(id: @contract.flat_id)
      if @contract.destroy
        flat_serializer = parse_json flat
        json_response "Deleted contract succesfully", true, {flat: flat_serializer  }, :ok
      else
        json_response "Delete contract failed", false, {}, :unprocessable_entity
      end
    else
      json_response "Delete contract failed", false, {}, :unprocessable_entity
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

  def contract_params
    params.require(:contract).permit(
      :flat_id,
      :booking_id,
      :contractor_id,
      :work_type,
      :work_sub_type,
      :contract_price,
      :total_price,
      :taxes,
      :fees,
      :adjustments,
      :paid,
      :special_requests,
      :approved,
      :contract_by_ical,
      :contract_by_self,
      :date_from,
      :date_to
    )
  end

  def load_contract
    # front end gets params and sends it in fetchFlatFromParams
    @contract = Contract.find_by id: params[:id]
    unless @contract.present?
      json_response "Cannot find contract", false, {}, :not_found
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
