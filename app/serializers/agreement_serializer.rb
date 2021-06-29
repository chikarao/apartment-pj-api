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
  :document_fields,
  :document_inserts,
  :document_pages,
  :document_type,
  :document_pdf_publicid,
  :document_pdf_pages,
  :document_page_size,
  :document_pdf_page_size,
  :created_at,
  :updated_at,
  :agreement_meta
  # has_many :flats
  # has_many :inspections

  # IMPORTANT: Below is a custom document_field serializer that returns document_field_choices
  # Rails default depth of child ssociations is one, so use custom to get another layer
  def agreement_meta
    new_hash = {}
    p "In agreement_serializer, agreement_meta, object, object.document_fields.class: " + object.to_s + " " + object.document_fields.class.to_s

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
    document_fields_method(object)
    # NOTE: Refactored to concerns/document_fields_method.rb
    # # Return array of document_fields
    # array = []
    # # Object is an agreement instance; Go through each document field to get
    # # document field choices if any and put them in a hash object mapped by index
    # if object.document_fields
    #   object.document_fields.each do |eachDF|
    #     custom_document_field = eachDF.attributes
    #     # p "In agreement_serializer in def　custom_document_field: " + custom_document_field.to_s
    #     obj = nil
    #
    #     # document_field_choices section
    #     if !eachDF.document_field_choices.empty?
    #       # if there are document_field_choices put them in a mapped hash object { 0 => object, 1 => object }
    #       obj = {}
    #       eachDF.document_field_choices.each_with_index do |each,  i|
    #         # get all attributes of each document_field_choices in a new object hash
    #         custom_each = each.attributes
    #         # select_choices nil if there are no select_choices
    #         # else put thim in a mapped hash object inside document_field_choices object
    #         custom_each["select_choices"] = nil
    #         if !each.select_choices.empty?
    #           custom_each["select_choices"] = {}
    #           each.select_choices.each_with_index do |each_select, i|
    #             custom_each["select_choices"][i] = each_select
    #           end
    #         end
    #         # obj[i] = each
    #         obj[i] = custom_each
    #       end # end of each
    #       custom_document_field["document_field_choices"] = obj
    #     else # else of if !eachDF.document_field_choices.empty?
    #       custom_document_field["document_field_choices"] = nil
    #     end # end of if document_field_choices empty
    #
    #     # document_field_translations section
    #     if !eachDF.document_field_translations.empty?
    #       custom_document_field["document_field_translations"] = {}
    #       eachDF.document_field_translations.each do |each|
    #         custom_each_translation = each.attributes
    #         # map hash to language_code
    #         custom_document_field["document_field_translations"][each.language_code] = custom_each_translation
    #       end # end of eachDF.document_field_choices.each do |each|
    #     else # else of if !eachDF.document_field_translations.empty?
    #       custom_document_field["document_field_translations"] = nil
    #     end # end of   if !eachDF.document_field_translations.empty?
    #
    #     array.push(custom_document_field)
    #   end # end of object.document_fields.each do |eachDF|
    # end # end of if object.document_fields
    #
    # return array
  end # end of function

end # End of class
