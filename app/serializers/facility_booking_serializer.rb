class FacilityBookingSerializer < ActiveModel::Serializer
  attributes :id,
  :facility_id,
  :booking_id,
  :facility,
  :created_at,
  :updated_at

  # has_many :flats
  # def facility
  #   return object.facility
  # end

end
