class Agreement < ApplicationRecord
  belongs_to :booking, optional: true
  # belongs_to :booking, optional: true
  belongs_to :flat, optional: true

  has_many :document_fields, dependent: :destroy
  has_many :document_inserts, dependent: :destroy

  # Enables creation and update of document_fields simultaneously
  # when agreement created and updated; Need to specify in params "document_field_attributes"
  accepts_nested_attributes_for :document_fields
  # Get agreeemts for flats of user
  scope :for_user_flat, ->(user_id) { where(flat_id: Flat.where(user_id: user_id ).pluck(:id)) }
  # Get agreements for Bookings of user's flats
  scope :for_bookings_for_user_flat, ->(user_id) { where(booking_id: Booking.where(flat_id: Flat.where(user_id: user_id).pluck(:id) )) }
  scope :for_user, ->(user_id) { where(booking_id: Booking.where(flat_id: Flat.where(user_id: user_id).pluck(:id) )).or(where(flat_id: Flat.where(user_id: user_id ).pluck(:id))) }
  scope :order_by_updated_at_asc, -> { order("updated_at ASC") }
  scope :order_by_updated_at_desc, -> { order("updated_at DESC") }
  # id: Booking.select('DISTINCT flat_id')
end
