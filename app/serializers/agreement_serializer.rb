class AgreementSerializer < ActiveModel::Serializer
  include DocumentFieldsMethod

  attributes :id,
  :booking_id,
  :flat_id,
  :document_publicid,
  :document_name,
  :tenant_signed,
  :owner_signed,
  :contractor_signed,
  :sent_to_tenant,
  :owner_approved,
  :tenant_approved,
  :contractor_approved,
  :language_code,
  :language_code_1,
  :template_file_name,
  :document_code,
  :document_fields, # calls document_fields method below
  :document_inserts,
  :document_pages,
  :document_type,
  :document_pdf_publicid,
  :document_pdf_pages,
  :document_page_size,
  :document_pdf_page_size,
  :created_at,
  :updated_at,
  :agreement_meta,
  :standard_document
  # has_many :flats
  # has_many :inspections

  # IMPORTANT: Below is a custom document_field serializer that returns document_field_choices
  # Rails default depth of child ssociations is one, so use custom to get another layer
  def agreement_meta
    new_hash = {}
    # p "In agreement_serializer, agreement_meta, object, object.document_fields.class: " + object.to_s + " " + object.document_fields.class.to_s
    object.document_pages.times do |each_page|
      # new_hash[each_page + 1] = object.document_fields.where(page: each_page + 1).count
      # .count works with what is in the database. since agreement is a dup there is
      # no database value for document_fields, so make a dup of document_field which was assigned in bookings_controller
      document_fields_dup = object.document_fields.dup
      new_hash[each_page + 1] = document_fields_dup.where(page: each_page + 1).count
    end
    return {"document_fields_num_by_page" => new_hash}
  end

  def document_fields
    # p "In agreement_serializer, document_fields, object, @instance_options: " + object.to_s + " " + @instance_options.to_s
    # NOTE: @instance_options is a hash sent as a parameter in serializable_resource.rb parse_json_custom method
    # Used in bookings#show to send a hash with agreement.id => page hash => document fields hash
    # When there are cached document/fields for an agreement, do not run document_fields_method
    # agreements_with_cached_document_fields_hash holds cached document_fields for agreement
    unless @instance_options[:custom_agreement] && @instance_options[object.id]
      document_fields_method(object)
      # NOTE: Refactored to concerns/document_fields_method.rb
    end
    # # Return array of document_fields
  end # end of function

end # End of class
