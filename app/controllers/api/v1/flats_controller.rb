class Api::V1::FlatsController < ApplicationController
  def index
    @flats = Flat.all.includes(:images)
    flats_serializer = parse_json @flats
    json_response "Indexed flats succesfully", true, {flats: flats_serializer}, :ok
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def strong_params
    params.require(:flat).permit
  end
end
