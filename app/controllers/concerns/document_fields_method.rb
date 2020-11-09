module DocumentFieldsMethod
  def document_fields_method(agreement)
    # Return array of document_fields
    array = []
    # Object is an agreement instance; Go through each document field to get
    # document field choices if any and put them in a hash object mapped by index
    if agreement.document_fields
      agreement.document_fields.each do |eachDF|
        custom_document_field = eachDF.attributes
        # p "In agreement_serializer in def　custom_document_field: " + custom_document_field.to_s
        obj = nil

        # document_field_choices section
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
              each.select_choices.each_with_index do |each_select, i|
                custom_each["select_choices"][i] = each_select
              end
            end
            # obj[i] = each
            obj[i] = custom_each
          end # end of each
          custom_document_field["document_field_choices"] = obj
        else # else of if !eachDF.document_field_choices.empty?
          custom_document_field["document_field_choices"] = nil
        end # end of if document_field_choices empty

        # document_field_translations section
        if !eachDF.document_field_translations.empty?
          custom_document_field["document_field_translations"] = {}
          eachDF.document_field_translations.each do |each|
            custom_each_translation = each.attributes
            # map hash to language_code
            custom_document_field["document_field_translations"][each.language_code] = custom_each_translation
          end # end of eachDF.document_field_choices.each do |each|
        else # else of if !eachDF.document_field_translations.empty?
          custom_document_field["document_field_translations"] = nil
        end # end of   if !eachDF.document_field_translations.empty?

        array.push(custom_document_field)
      end # end of agreement.document_fields.each do |eachDF|
    end # end of if object.document_fields

    return array
  end # end of function

end
