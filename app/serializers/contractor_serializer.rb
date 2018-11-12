class ContractorSerializer < ActiveModel::Serializer
  attributes :id,
    :user_id,
    :contractor_type,
    :contractor_sub_type,
    :contractor_sales_heading,
    :contractor_intro,
    :price,
    :price_range,
    :days_closed,
    :time_from,
    :time_to,
    :specialty,
    :phone,
    :mobile,
    :email,
    :company_name,
    :registration_number,
    :registration_type,
    :registration_date,
    :first_name,
    :last_name,
    :title,
    :stamp,
    :fax,
    :facebook,
    :twitter,
    :line,
    :image,
    :url,
    :lat,
    :lng,
    :address1,
    :address2,
    :city,
    :zip,
    :state,
    :region,
    :country,
    :staffs,
    :created_at,
    :updated_at

    has_many :staffs

  # has_many :flats
  # has_many :inspections

  # !!!!!!add building_type to replace type; does not show up in serialized results
end
