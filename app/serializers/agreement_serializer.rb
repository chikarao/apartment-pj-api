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

  # IMPORTANT: Below is a custom document_field serializer that returns document_field_choices
  # Rails default depth of child ssociations is one, so use custom to get another layer
  def document_fields
    # Return array of document_fields
    array = []
    # Object is an agreement instance; Go through each document field to get
    # document field choices if any and put them in a hash object mapped by index
    if object.document_fields
      object.document_fields.each do |eachDF|
        custom_document_field = eachDF.attributes
        p "In document_field_serializer in def　custom_document_field: " + custom_document_field.to_s
        obj = nil
        if !eachDF.document_field_choices.empty?
          # if there are document_field_choices put them in a mapped hash object { 0 => object, 1 => object }
          obj = {}
          eachDF.document_field_choices.each_with_index do |each,  i|
            # get all attributes of each document_field_choices in a new object hash
            custom_each = each.attributes
            # select_choices nil if there are no select_choices
            # else put thim in a mapped hash object inside document_field_choices object 
            custom_each["select_choices"] = nil
            if !each.select_choices.empty?
              custom_each["select_choices"] = {}
              each.select_choices.each_with_index do |eachSelect, i|
                custom_each["select_choices"][i] = eachSelect
              end
            end
            # obj[i] = each
            obj[i] = custom_each
          end # end of each
          custom_document_field["document_field_choices"] = obj
        else # else of if !eachDF.document_field_choices.empty?
          custom_document_field["document_field_choices"] = nil
        end # end of if document_field_choices empty
        array.push(custom_document_field)
      end # end of each
    end # end of if object.document_fields
    return array
  end # end of function

end # End of class
