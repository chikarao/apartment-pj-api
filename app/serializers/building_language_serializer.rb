class BuildingLanguageSerializer < ActiveModel::Serializer
  attributes :id,
  :name,
  :address1,
  :address2,
  :city,
  :state,
  :zip,
  :region,
  :country,
  :construction,
  :electricity,
  :building_type,
  :building_management_company,
  :building_management_contact,
  :building_management_address,
  :asbestos_survey_contents,
  :earthquake_study_contents,
  :building_owner_name,
  :building_owner_address,
  :language_code,
  :legal_restrictions,
  :legal_restrictions_summary,
  :created_at,
  :updated_at

  # has_many :flats
  # has_many :inspections

  # !!!!!!add building_type to replace type; does not show up in serialized results
end
