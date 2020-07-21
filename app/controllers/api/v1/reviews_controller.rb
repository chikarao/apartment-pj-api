class Api::V1::ReviewsController < ApplicationController
  before_action :valid_token, only: [:create, :destroy, :update]
  before_action :does_review_already_exist, only: [:create]
  before_action :load_booking, only: [:create]
  before_action :load_review, only: [:show, :destroy, :update]

  def index

  end

  def show
    review_serializer = parse_json @review

    json_response "Showed review successfully", true, {review: review_serializer}, :ok
  end

  def create
    review = Review.new review_params
    review.user_id = @user.id
    review.flat_id = @booking.flat.id
    if review.save
      review_serializer = parse_json review

      json_response "Created review succesfully", true, {review: review_serializer}, :ok
    else
      json_response "Create review failed", false, {}, :unprocessable_entity
    end
  end

  def update
    if @user.id == @review.user_id
      if @review.update review_params
        review_serializer = parse_json @review

        json_response "Updated review succesfully", true, {review: review_serializer}, :ok
      else
      json_response "Update review failed", false, {}, :unprocessable_entity
      end
    else
    json_response "You do not have permission to update", false, {}, :unauthorized
    end
  end

  def destroy
    if @user.id == @review.user_id
      if @review.destroy
        json_response "Deleted review succesfully", true, {review: @review}, :ok
      else
        json_response "Delete review failed", false, {}, :unprocessable_entity
      end
    else
      json_response "You do not have permission to delete", false, {}, :unauthorized
    end
  end

  private
  
  def valid_token
    @user = User.find_by authentication_token: request.headers["AUTH-TOKEN"]
    p "ReviewsController, valid_token, @user: " + @user.to_s
    if @user
      return @user
    else
      json_response "Invalid token", false, {}, :failure
    end
  end
# def load_book
#   @book = Book.find_by id: params[:book_id]
#   unless @book.present?
#     json_response "Cannot find book", false, {}, :not_found
#   end
# end

  def load_review
    @review = Review.find_by id: params[:id]
    unless @review.present?
      json_response "Cannot find review", false, {}, :not_found
    end
  end

  def load_booking
    @booking = Booking.find_by id: review_params[:booking_id]
    unless @booking.present?
      json_response "Cannot find booking", false, {}, :not_found
    end
  end

  def review_params
    params.require(:review).permit :flat_id, :booking_id, :title, :comment, :rating, :review_for_flat, :review_for_user, :review_for_site
  end

  def does_review_already_exist
    review = Review.find_by(user_id: @user.id, booking_id: review_params[:booking_id])
    if review
      p "review controller review_already_exists" + review.to_s
      json_response "A review for that booking already exists.", false, {}, :bad_request
      return
    end
  end
end
