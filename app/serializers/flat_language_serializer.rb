class FlatLanguageSerializer < ActiveModel::Serializer
  attributes :id, :flat_id, :language_code, :address1, :address2, :city, :state, :zip,
  :region, :country, :area, :sales_point, :description, :flat_type, :intro,
  :cancellation, :construction, :school_district, :school_district1, :station, :station1, :owner_name, :owner_contact_name, :owner_address, :ownership_rights,
  :other_rights

  belongs_to :flat
end
