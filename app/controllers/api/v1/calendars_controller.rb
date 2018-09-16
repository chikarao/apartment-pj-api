class Api::V1::CalendarsController < ApplicationController
  before_action :load_calendar, only: [:update, :destroy]
  # before_action :load_flat, only: :show
  before_action :valid_token, only: [:index, :create, :update, :destroy]


  def index
    @calendars = Calendar.where(flat_id: params[:flat_id])
    unless @calendars.empty?
      calendar_serializer = parse_json @calendars
      json_response "Indexed calendars succesfully", true, {calendars: calendar_serializer}, :ok
    else
      json_response "Index calendar found no calendars for flat", false, {}, :unprocessable_entity
    end
  end

  def create
    p "CalendarsController, create, here is calendar params" + calendar_params.to_s
    calendar = Calendar.new calendar_params

    calendar.created_at = DateTime.now

    if calendar.save
      calendar_serializer = parse_json calendar
      json_response "Created calendar succesfully", true, {calendar: calendar_serializer}, :ok
    else
      json_response "Create calendar failed", false, {}, :unprocessable_entity
    end
  end

  def update
    # p "CalendarsController, update, here is @calendars" + @calendars.to_s
    if @calendar.update(calendar_params)
      calendar_serializer = parse_json @calendar
      json_response "Updated calendar successfully", true, {calendar: calendar_serializer}, :ok
    else
      json_response "Update calendar failed", false, {}, :unprocessable_entity
    end
  end

  def destroy

      if @calendar.destroy
        json_response "Deleted calendar succesfully", true, {calendar: @calendar}, :ok
      else
        json_response "Delete calendar failed", false, {}, :unprocessable_entity
      end

  end

  private

  def load_calendar
    # p "!!!!!!params[:id]: " + params[:calendars_id].to_s
    @calendar = Calendar.find_by id: params[:id]
    unless @calendar.present?
      json_response "Cannot find calendars", false, {}, :not_found
    end
  end

  def calendar_params
    params.require(:calendars).permit(:flat_id, :ical_url, :name)
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
