class BuildingSerializer < ActiveModel::Serializer
  attributes :id, :name, :address1, :address2, :city, :state, :zip, :region, :country, :construction, :type, :year_built, :last_renovation_year, :units, :floors,
    :floors_underground, :power_usage_amount, :gas, :water, :sewage, :building_management_company, :building_management_phone, :building_management_contact, :building_inspection_conducted,
    :inside_disaster_prevention, :inside_disaster_warning, :inside_tsunami_warning, :asbestos_record, :asbestos_survey_contents, :earthquake_study_performed, :earthquake_study_contents, :created_at, :updated_at

  has_many :flats
end
