module TemplateElementFunctions
  include ContractTranslationMapObject
  include DocumentConstants

  def get_template_mapping_object(translation, base)
    # Function to get hash object like { flat: { address: object },
    # document: { date: { year: object, month: object, day: object }}}
    # from ImportantPointsExplanationBilingualAll and FixedTermRentalContractBilingualAll
    # with translation objects DocumentTranslationFixedTermAll and DocumentTranslationImportantPointsAll
    # called in BookingsController#show
    # count = 0
    object = {} # returned object
    count = 0
    count_all = 0
    # p "!!!!! booking_controller TemplateElementFunctions, create object, called:
    base.keys.each do |each| # Iterate through hash objects
      # count += 1
      count_all += 1
      # if the hash has translation_key AND category, put them in returned object
      if base[each][:translation_key] && base[each][:category]
        count += 1
        # Put translation and examples in each; keys need to be converted to symbol
        base[each][:translation] = translation[base[each][:translation_key].to_sym][:translations]
        base[each][:examples] = translation[base[each][:translation_key].to_sym][:examples]
        # if base[each][:translation_field]
        # If each has translation sibling, in translation_field put sibling in EACH
        # IMPORTATNT: After running code, base[each][:translation_sibling] becomes a Hash so, test if already Hash
        if base[each][:translation_field]
        # if base[each][:translation_sibling]
          # p "!!!!! template_element_functions, each, base[each]: " + each.to_s + ' ' + base[each].to_s
          base[each][:translation_sibling] = base[base[each][:translation_field].to_sym]
          # base[each][:translation_sibling] = base[base[each][:translation_sibling]]
        else
          base[each][:translation_sibling] = nil
        end
        # Below puts each in category and group
        unless base[each][:translation_object]
          if base[each][:group]
            unless object[base[each][:category]]
              # base[each][:translation] = translation[base[each][:translation_key][:translations].to_sym]
              object[base[each][:category]] = {}
              object[base[each][:category]][base[each][:group]] = {}
              object[base[each][:category]][base[each][:group]][each] = base[each]
            else # else of unless object[base[each][:category]]
              unless object[base[each][:category]][base[each][:group]]
                object[base[each][:category]][base[each][:group]] = {}
                object[base[each][:category]][base[each][:group]][each] = base[each]
              else
                object[base[each][:category]][base[each][:group]][each] = base[each]
              end
            end # end of unless object[base[each][:category]]

          else # else of if base[each][:group]
            unless object[base[each][:category]]
              object[base[each][:category]] = {}
              object[base[each][:category]][each] = base[each]
            else
              # base[each][:translation] = translation[base[each][:translation_key][:translations].to_sym]
              object[base[each][:category]][each] = base[each]
            end # End of unless object[base[each][:category]]
          end # End of if base[each][:group]
        end # End unless base[each][:translation_object]

      end # End of if base[each][:translation_key] && base[each][:category]
    end# End of each base.keys
    p "!!!!! booking_controller TemplateElementFunctions, count, count_all: " + count.to_s + ' ' + count_all.to_s
    return object
  end # End of function get_template_mapping_object


  def get_simplified_template_field_object(document_fields, agreement, document_language_code)
    # Function returns array with document_fields that have attributes according to
    # to choice chosen; Called in agreement controller
    returned_object = {}
    document_fields_hash = {}
    document_translation_fields_hash = {}
    all_object = ContractTranslationMapObject::OBJECT[agreement[:template_file_name]][:all_object]
    translations_object = ContractTranslationMapObject::OBJECT[agreement[:template_file_name]][:translations]
    base_language = agreement[:language_code]
    translation_language = document_language_code

    get_translations_hash = lambda do |field|
      return_hash = {}
      field.document_field_translations.each do |each|
        return_hash[each.language_code] = each.value
      end
      # if return hash does not have translation_language, fill in with standard
      return_hash[translation_language] = translations_object[field.name.to_sym][:translations][translation_language] if !return_hash[translation_language]
      return return_hash
    end

    add_to_page_mapped_hash = lambda do |field|
      if !field[:translation_element]
        if document_fields_hash[field[:page]]
          document_fields_hash[field[:page]].push(field)
        else
          document_fields_hash[field[:page]] = [field]
        end
      else
        new_field = { :attributes => {
                        :width => field.width,
                        :top => field.top,
                        :left => field.left,
                        :font_size => field.font_size,
                        :class_name => field.class_name,
                        :font_size => field.font_size,
                        :font_weight => field.font_weight,
                        :rotate => field.transform,
                        :transform_origin => field.transform_origin,
                        :text_align => field.text_align,
                        :height => field.height
                      },
                      :translations => field.document_field_translations.length > 0 ? get_translations_hash(field) : translations_object[field.name.to_sym][:translations]
                    }
        # patch for rotate as DB keeps .transform degrees (e.g. '90')
        # new_field[:rotate] = field.transform if field.transform
        if document_translation_fields_hash[field[:page]]
          document_translation_fields_hash[field[:page]][field.name.to_sym] = new_field
        else
          document_translation_fields_hash[field[:page]] = { field.name.to_sym => new_field }
        end
      end
    end

    document_fields.each do |each_field|
      # p "!!!!! agreement_controller TemplateElementFunctions, get_simplified_template_field_object, each_field.name, document_fields, document_fields.count: " + each_field.name.to_s + ' ' + document_fields.to_s + ' ' + document_fields.count.to_s + ' ' + each_field.to_s
      # If each_field has any choices, test length as none is empty array)
      if each_field.document_field_choices.length > 0
        simplified_document_field = {}
        each_field.document_field_choices.each do |each_choice|
          if each_choice.select_choices.length > 0
            each_choice.select_choices.each do |each_select|
              select_true_or_false = false
              select_amenities = false
              select_value_path = {}
              if each_select[:value] === each_field[:value]
                # Set conditions for setting path to select field value (actual text that is rendered)
                # when requiring bool true, convert 't' or 'f' to boolean
                # all booleans are stored as 't' or 'f' in database
                select_value_in_bool = each_select[:value] === 't'
                # Find out if all_object object is a treu false object by seeing if there is true in choices hash
                select_true_or_false = !all_object[each_field.name.to_sym][:choices][true].nil?
                # if all.object[each_field.name][choices] has the select value (not selectChoices)
                select_with_value_in_choice = !all_object[each_field.name.to_sym][:choices][each_select[:value].to_sym].nil?
                # amenities have a particular true false choice; important points all have same 0, 1 select
                select_amenities_and_choices_0_1 = all_object[each_field[:name].to_sym][:category] === 'amenities' || (all_object[each_field.name.to_sym][:choices][0] && all_object[each_field.name.to_sym][:choices][0][translation])
                # p "!!!!! agreement_controller TemplateElementFunctions, get_simplified_template_field_object, each_select.value, each_field[:name], select_true_or_false: " + each_select.value.to_s + ' ' + each_field[:name].to_s + ' ' + select_true_or_false.to_s
                # set path to getting values so below just use language code to get the text value
                select_value_path = all_object[each_field[:name].to_sym][:choices][:inputFieldValue][:selectChoices][each_select[:value].to_sym] if (!select_true_or_false && !select_amenities_and_choices_0_1 && !select_with_value_in_choice)
                # select_value_path = all_object[each_field[:name].to_sym][:choices][:inputFieldValue][:selectChoices][each_select[:value].to_sym] if (!select_true_or_false && !select_amenities_and_choices_0_1)
                select_value_path = all_object[each_field[:name].to_sym][:choices][select_value_in_bool][:translation] if (select_true_or_false)
                select_value_path = all_object[each_field[:name].to_sym][:choices][each_select[:value].to_sym][:translation] if (select_with_value_in_choice)
                # get text value for amenities
                if (select_amenities_and_choices_0_1)
                  bool_value = 0
                  bool_value = 0 if (each_field[:value] === 't')
                  bool_value = 1 if (each_field[:value] === 'f')
                  if all_object[each_field[:name].to_sym][:category] === 'amenities'
                    # the amenities hash objects do not have translations on them so use hash straight from document constants
                    select_value_path = DocumentConstants::AmenitiesChoices[bool_value]
                  else
                    select_value_path = all_object[each_field.name.to_sym][:choices][bool_value][translation]
                  end
                end
                # p "!!!!! agreement_controller TemplateElementFunctions, get_simplified_template_field_object, each_select.value, each_field[:name], all_object: " + each_select.value.to_s + ' ' + each_field[:name] + ' ' + all_object[each_field[:name].to_sym].to_s
                simplified_document_field = {
                  name: each_field[:name],
                  val: each_choice[:val],
                  top: each_choice[:top],
                  left: each_choice[:left],
                  width: each_choice[:width],
                  height: each_choice[:height],
                  text_align: each_choice[:text_align],
                  font_size: each_choice[:font_size],
                  class_name: each_choice[:class_name],
                  input_type: each_choice[:input_type],
                  page: each_field[:page],
                  # if not a translation field (a select field that renders the translation language), get the base_language
                  value: !each_field[:translation] ? select_value_path[base_language.to_sym] : select_value_path[translation_language.to_sym]
                }
                add_to_page_mapped_hash.call(simplified_document_field)
              end
            end
          else # else of if each_choice.select_choices
            if each_choice[:val] === each_field[:value]
              simplified_document_field = {
                name: each_field[:name],
                val: each_choice[:val],
                top: each_choice[:top],
                left: each_choice[:left],
                width: each_choice[:width],
                height: each_choice[:height],
                font_size: each_choice[:font_size],
                text_align: each_choice[:text_align],
                class_name: each_choice[:class_name],
                input_type: each_choice[:input_type],
                page: each_field[:page]
              }
              # p "!!!!! agreement_controller TemplateElementFunctions, get_simplified_template_field_object, each_field[:name], simplified_document_field: " + each_field[:name].to_s + ' ' + simplified_document_field.to_s
              add_to_page_mapped_hash.call(simplified_document_field)
            end
          end # end of if each_choice.select_choices
          # simplified_document_field = { val: 'inputFieldValue', top: '10.2%', left: '13.3%', width: '29.5%', height: '1.6%', text_align: 'right', class_name: 'document-rectangle', input_type: 'string' } },
        end # end of   document_fields.document_field_choices.each do |each_choice|
      else # else of if document_fields.document_field_choices
        # if each_field does NOT have document_field_choices push into returned_object
        add_to_page_mapped_hash.call(each_field)
      end # end of if document_fields.document_field_choices

    end # end of document_fields.each do |each_field|
    returned_object =  { document_fields: document_fields_hash , translation: document_translation_fields_hash }
    p "!!!!! agreement_controller TemplateElementFunctions, get_simplified_template_field_object, returned_object: " + returned_object.to_s
    return returned_object
  end

end # End of module
