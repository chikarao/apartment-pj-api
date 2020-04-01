class AgreementSerializer < ActiveModel::Serializer
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
  :created_at,
  :updated_at
  # has_many :flats
  # has_many :inspections
  def document_fields
    array = []
    if object.document_fields
      object.document_fields.each do |eachDF|
        custom_document_field = eachDF.attributes
        p "In document_field_serializer in def　custom_document_field: " + custom_document_field.to_s
        obj = nil
        if !eachDF.document_field_choices.empty?
          obj = {}
          eachDF.document_field_choices.each_with_index do |each,  i|
            obj[i] = each
          end # end of each
          custom_document_field["document_field_choices"] = obj
        else
          custom_document_field["document_field_choices"] = nil
        end # end of if document_field_choices empty
        array.push(custom_document_field)
      end # end of each
      #object is a DocumentField instance
    end # end of if object.document_fields
  # end
    return array
  end # end of function
  # !!!!!!add building_type to replace type; does not show up in serialized results
end
