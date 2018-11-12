class AssignmentSerializer < ActiveModel::Serializer
  attributes :id,
    :contract_id,
    :staff_id,
    :staff_approved,
    :staff_finished,
    :finished,
    :taxes,
    :fees,
    :adjustments,
    :total_pay,
    :paid,
    :role,
    :leader,
    :assignment_by_ical,
    :assignment_by_self,
    :date_from,
    :date_to,
    :staff,
    :created_at,
    :updated_at

  belongs_to :staff
  belongs_to :contract
  # has_many :flats
  # has_many :inspections

  # !!!!!!add building_type to replace type; does not show up in serialized results
end
