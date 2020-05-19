class Facility < ApplicationRecord
  belongs_to :flat, optional: true
  # Should not belong to booking; Keep optionsl
  # belongs_to :booking, optional: true

  has_many :facility_bookings, dependent: :destroy
end
