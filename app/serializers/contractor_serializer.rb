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
    # jurisdiction is prefecture in japan
    :registration_jurisdiction,
    # grantor is governor or minister in japan
    :registration_grantor,
    :registration_number_front,
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
    :language_code,
    :base_record_id,
    :bond_deposit_office,
    :bond_deposit_office_address,
    :guaranty_association_name,
    :guaranty_association_address,
    :guaranty_association_office_address,
    :created_at,
    :updated_at

    has_many :staffs

  # has_many :flats
  # has_many :inspections

  # !!!!!!add building_type to replace type; does not show up in serialized results
end
