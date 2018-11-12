class Api::V1::AssignmentsController < ApplicationController
  # before_action :load_flat, only: :show
  before_action :load_assignment, only: [:destroy, :update]
  before_action :valid_token, only: [:destroy, :update, :create]

  # def index
  # end
  #
  # def show
  # end
  #
  # def new
  # end

  def create
    assignment = Assignment.new assignment_params
    contract = Contract.find_by(id: assignment_params[:contract_id])
    # staff = Staff.find_by(id: assignment_params[:staff_id])
    flat = Flat.find_by(id: contract.flat_id)
    p "flat : " + flat.to_s
    assignment.created_at = DateTime.now
    # only if have parent
    # assignment.book_id = params[:book_id]
    if assignment.save
      flat_serializer = parse_json flat
      assignment_serializer = parse_json assignment
      json_response "Created assignment successfully", true, {assignment: assignment_serializer, flat: flat_serializer}, :ok
    else
      json_response "Create assignment failed", false, {}, :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @assignment.update assignment_params
      contract = Contract.find_by(id: @assignment.contract_id)
      flat = Flat.find_by(id: contract.flat_id)
      flat_serializer = parse_json flat
      assignment_serializer = parse_json @assignment
      json_response "Updated assignment succesfully", true, {assignment: assignment_serializer, flat: flat_serializer}, :ok
    else
      json_response "Updated assignment failed", false, {}, :unprocessable_entity
    end
  end

  def destroy
    if @user.id = current_user.id
      contract = Contract.find_by(id: @assignment.contract_id)
      flat = Flat.find_by(id: contract.flat_id)
      if @assignment.destroy
        flat_serializer = parse_json flat
        json_response "Deleted assignment succesfully", true, {flat: flat_serializer  }, :ok
      else
        json_response "Delete assignment failed", false, {}, :unprocessable_entity
      end
    else
      json_response "Delete assignment failed", false, {}, :unprocessable_entity
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

  def assignment_params
    params.require(:assignment).permit(
      :contract_id,
      :staff_id,
      :staff_approved,
      :staff_finished,
      :finished,
      :taxes,
      :fees,
      :adjustments,
      :total_pay,
      :paid,
      :role,
      :leader,
      :assignment_by_ical,
      :assignment_by_self,
      :date_from,
      :date_to
    )
  end

  def load_assignment
    # front end gets params and sends it in fetchFlatFromParams
    @assignment = Assignment.find_by id: params[:id]
    unless @assignment.present?
      json_response "Cannot find assignment", false, {}, :not_found
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
