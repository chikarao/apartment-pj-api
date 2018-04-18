class Api::V1::ImagesController < ApplicationController
  def index
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
    params.require(:image).permit
  end
end
