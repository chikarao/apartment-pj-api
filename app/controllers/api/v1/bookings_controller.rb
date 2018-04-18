class Api::V1::BookingsController < ApplicationController
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
    params.require(:book).permit
  end
end
