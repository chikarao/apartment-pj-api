class Api::V1::BankAccountsController < ApplicationController
  # before_action :load_flat, only: [:destroy, :show, :create, :update]
  before_action :load_bank_account, only: [:destroy, :show, :update]
  # before_action :load_bank_account, only: :destroy
  before_action :valid_token, only: [:index, :destroy, :create, :update]

  def index
    bank_accounts = BankAccount.where(user_id: @user.id)
    unless bank_accounts.empty?
      # @flat.save
      bank_account_serializer = parse_json bank_accounts
      # bank_account_serializer = parse_json @bank_account
      json_response "Indexed bank_account succesfully", true, {bank_accounts: bank_account_serializer}, :ok
    else
      json_response "Indexed bank_account failed", false, {}, :unprocessable_entity
    end

  end

  def create
    bank_account = BankAccount.new bank_account_params
    bank_account.created_at = DateTime.now
    bank_account.user_id = @user.id
    # only if have parent
    # bank_account.book_id = params[:book_id]
    if bank_account.save
      bank_accounts = BankAccount.where(user_id: @user.id)
      # bank_account_serializer = parse_json bank_account
      # @flat.bank_account_id = bank_account.id
      # @flat.save
      bank_account_serializer = parse_json bank_accounts
      # bank_account_serializer = parse_json @bank_account
      json_response "Created bank_account succesfully", true, {bank_accounts: bank_account_serializer}, :ok
    else
      json_response "Create bank_account failed", false, {}, :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @bank_account.update bank_account_params
      bank_accounts = BankAccount.where(user_id: @user.id)
      bank_account_serializer = parse_json bank_accounts
      # flat = Flat.find_by(id: params[:flat_id])
      # flat_serializer = parse_json @flat
      # bank_account_serializer = parse_json @bank_account
      json_response "Updated bank_account succesfully", true, {bank_account: bank_account_serializer}, :ok
    else
      json_response "Update flat failed", false, {}, :unprocessable_entity
    end
  end

  def destroy
      if @bank_account.destroy
        bank_accounts = BankAccount.where(user_id: @user.id)
        bank_account_serializer = parse_json bank_accounts
        json_response "Deleted bank_account succesfully", true, {bank_account: bank_account_serializer}, :ok
      else
        json_response "Delete bank_account failed", false, {}, :unprocessable_entity
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

  def bank_account_params
    params.require(:bank_account).permit(:account_first_name, :account_last_name, :account_name, :bank_name, :branch_name, :bank_address, :branch_number, :account_number, :account_type, :routing_number, :swift)
  end

  def load_bank_account
    # front end gets params and sends it in fetchFlatFromParams
    @bank_account = BankAccount.find_by id: params[:id]
    unless @bank_account.present?
      json_response "Cannot find bank_account", false, {}, :not_found
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
