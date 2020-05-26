module TemplateElementFunctions

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

  def get_template_translation_object(object_i, object_f)
    # p "!!!!! booking_controller TemplateElementFunctions, get_template_translation_object, for object_i: " + object_i.to_s
    # p "!!!!! booking_controller TemplateElementFunctions, get_template_translation_object, object_f: " + object_f.to_s
    # count_i = 0
    # count_f = 0
    # count_overlap = 0
    # count_all = 0
    # array = []
    returned_object = {}
    overlap_object = {}

    add_to_object = ->(object, each) {
      if returned_object[object[each][:category]]
        if object[each][:group]
          if returned_object[object[each][:category]][object[each][:group]]
            returned_object[object[each][:category]][object[each][:group]] = object[each]
          else
            returned_object[object[each][:category]][object[each][:group]] = { each => object[each] }
          end
        else
          returned_object[object[each][:category]][each] = object[each]
        end
      else # else of   if returned_object[object[each][:category]]
        returned_object[object[each][:category]] = { each => object[each] }
      end # end of returned_object[object_i[each][:category]]
    }

    object_i.keys.each do |each|
      if object_f[each]
        overlap_object[each] = nil
        # count_overlap += 1
      end
      # def add_to_object(each)
      # end # end of add_to_object

      if object_i[each][:category]
        # count_i += 1
        # count_all += 1
        add_to_object.call(object_i, each)
      end
    end

    object_f.keys.each do |each|
      if !overlap_object[each] && object_f[each][:category]
      # if !overlap_object[each] && object_f[each][:category]
        # count_f += 1
        # count_all += 1
        add_to_object.call(object_f, each)
      end
    end
    #   if object_f[each]
    #     count_overlap += 1
    #     array.push(each)
    #   end
    # end # end of each
    #
    # object_f.keys.each do |each|
    #   count_f += 1
    # end # end of each
    # p "!!!!! booking_controller TemplateElementFunctions, get_template_translation_object, count_i, count_f, count_overlap, count_all: " + count_i.to_s + ' ' + count_f.to_s + ' ' + count_overlap.to_s + ' ' + count_all.to_s
    # p "!!!!! booking_controller TemplateElementFunctions, get_template_translation_object, returned_object: " + returned_object.to_s
    return returned_object
  end

end # End of module
