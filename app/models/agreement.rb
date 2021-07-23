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
  # get all agreements where user is owner of the flat in booking of booking_id, and agreements where user is owner of flat of flat_id
  scope :for_user, ->(user_id) { where(booking_id: Booking.where(flat_id: Flat.where(user_id: user_id).pluck(:id) )).or(where(flat_id: Flat.where(user_id: user_id ).pluck(:id))) }

  scope :for_user_with_standard_documents, ->(user_id) { where(booking_id: Booking.where(flat_id: Flat.where(user_id: user_id).pluck(:id) )).or(where(flat_id: Flat.where(user_id: user_id ).pluck(:id))).or(where(standard_document: true)) }

  scope :order_by_updated_at_asc, -> { order("updated_at ASC") }

  scope :order_by_updated_at_desc, -> { order("updated_at DESC") }

  # scope :document_fields_for_pages, ->(pages_array) { includes(:document_fields).where("page = ?", pages_array) }
  # scope :document_fields_for_pages, ->(pages_array) { joins(:document_fields).merge(DocumentField.limit_pages(pages_array)) }

  # scope :document_fields_for_pages, ->(pages_array) { joins(:document_fields).merge(DocumentField.where("agreement_id = ?", self[:id]).limit_pages(pages_array)) }
  # scope :document_fields_for_pages, ->(pages_array) { joins(:document_fields).merge() }
  # scope :document_fields_for_pages, ->(pages_array) { joins(:document_fields).where("document_fields.page = ?", pages_array) }
  # def document_fields_for_pages(pages_array)
  #   # p "!!!! In agreement model agreements_test, document_fields_for_pages each.id, each.document_fields.count: " + self.id.to_s + " " + each.document_fields.count.to_s
  #
  #   # document_fields.limit_pages(pages_array, self.id)
  #   document_fields.limit_pages(pages_array)
  # end

  scope :document_fields_for_pages, lambda {|booking_id, pages_array|
    # p "!!!! In agreement model agreements_test, document_fields_for_pages pages_array, self: " + pages_array.to_s + " " + self.column_names.to_s
    where("booking_id = ?", booking_id).merge(:document_fields).where("page = ?", pages_array)
    # where("page = ?", pages_array)
    # self.document_fields.limit_pages(pages_array)
  }

  # scope :agreements_with_document_field_subset, ->(pages_array, user_id) { where(booking_id: Booking.where(flat_id: Flat.where(user_id: user_id).pluck(:id) )).or(where(flat_id: Flat.where(user_id: user_id ).pluck(:id))) }

  # id: Booking.select('DISTINCT flat_id')
end
