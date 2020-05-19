class FacilityBooking < ApplicationRecord
  belongs_to :booking, optional: true
  belongs_to :facility
  belongs_to :user, optional: true
end
