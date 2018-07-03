class Api::V1::ViewsController < ApplicationController
  before_action :valid_token, only: [:create, :destroy]
  # before_action :load_booking, only: [:create]
  before_action :load_views, only: [:index, :destroy]

  def index
    num_views = @views.count
    view_serializer = parse_json @views
    json_response "Showed view successfully", true, {view: view_serializer, numFlatViews: num_views}, :ok
  end

  def show
  end

  def create
    view = View.new view_params
    view.user_id = @user.id
    if view.save
      view_serializer = parse_json view
      json_response "Created view succesfully", true, {view: view_serializer}, :ok
    else
      json_response "Create view failed", false, {}, :unprocessable_entity
    end
  end

  def update
    # if @user.id == @view.user_id
    #   if @view.update view_params
    #     view_serializer = parse_json @view
    #
    #     json_response "Updated view succesfully", true, {view: view_serializer}, :ok
    #   else
    #   json_response "Update view failed", false, {}, :unprocessable_entity
    #   end
    # else
    # json_response "You do not have permission to update", false, {}, :unauthorized
    # end
  end

  def destroy
    if @user.id == @view.user_id
      if @view.destroy
        json_response "Deleted view succesfully", true, {view: @view}, :ok
      else
        json_response "Delete view failed", false, {}, :unprocessable_entity
      end
    else
      json_response "You do not have permission to delete", false, {}, :unauthorized
    end
  end

  private
    def valid_token
      @user = User.find_by authentication_token: request.headers["AUTH-TOKEN"]
      p "ViewsController, valid_token, @user: " + @user.to_s
      if @user
        return @user
      else
        json_response "Invalid token", false, {}, :failure
      end
    end

    def load_views
      @views = View.where(flat_id: params[:flat_id])
      unless @views.present?
        json_response "Cannot find view", false, {}, :not_found
      end
    end

    def load_flat
      @view = View.find_by flat_id: params[:id]
      unless @view.present?
        json_response "Cannot find view", false, {}, :not_found
      end
    end

    def view_params
      params.require(:view).permit(:flat_id, :location, :device)
    end
end
