class StaffSerializer < ActiveModel::Serializer
  attributes :id,
  :contractor_id,
  :user_id,
  :first_name,
  :last_name,
  :identification,
  :tax_identification,
  :birthday,
  :title,
  :division,
  :group,
  :representative,
  :manager,
  :salary,
  :bonus,
  :bonus_months,
  :contract,
  :registration,
  :registration_type,
  :stamp,
  :mobile,
  :phone,
  :fax,
  :email,
  :line,
  :lat,
  :lng,
  :location_name,
  :location_number,
  :address1,
  :address2,
  :city,
  :state,
  :zip,
  :region,
  :country,
  :calendar,
  :language_code,
  :base_record_id,
  :created_at,
  :updated_at

  # has_many :flats
  # has_many :inspections
  has_many :assignments

  # !!!!!!add building_type to replace type; does not show up in serialized results
end
