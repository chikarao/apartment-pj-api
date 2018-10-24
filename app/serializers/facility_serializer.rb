class FacilitySerializer < ActiveModel::Serializer
  attributes :id,
  :flat_id,
  :booking_id,
  :optional,
  :facility_type,
  :price_per_month,
  :discount,
  :facility_number,
  :facility_deposit,
  :facility_key_money,
  :facility_management_fees,
  :facility_format,
  :facility_broker_fees,
  :facility_name,
  :on_building_grounds,
  :created_at,
  :updated_at

  # has_many :flats

  # !!!!!!add building_type to replace type; does not show up in serialized results
end
