class ContractSerializer < ActiveModel::Serializer
  attributes :id,
    :flat_id,
    :booking_id,
    :contractor_id,
    :work_type,
    :work_sub_type,
    :contract_price,
    :total_price,
    :taxes,
    :fees,
    :adjustments,
    :paid,
    :special_requests,
    :approved,
    :contract_by_ical,
    :contract_by_self,
    :date_from,
    :date_to,
    :contractor,
    :assignments,
    :created_at,
    :updated_at

  # has_many :flats
  # has_many :inspections

  # !!!!!!add building_type to replace type; does not show up in serialized results
end
