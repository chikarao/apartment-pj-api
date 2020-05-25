module TemplateElementFunctions

  def get_template_mapping_object(translation, base)
    # Function to get hash object like { flat: { address: object },
    # document: { date: { year: object, month: object, day: object }}}
    # from ImportantPointsExplanationBilingualAll and FixedTermRentalContractBilingualAll
    # with translation objects DocumentTranslationFixedTermAll and DocumentTranslationImportantPointsAll
    # called in BookingsController#show
    # count = 0
    object = {} # returned object
    # p "!!!!! booking_controller TemplateElementFunctions, create object, called:
    base.keys.each do |each| # Iterate through hash objects
      # count += 1
      # if the hash has translation_key AND category, put them in returned object
      if base[each][:translation_key] && base[each][:category]
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
    # p "!!!!! booking_controller TemplateElementFunctions, count: " + count.to_s
    return object
  end # End of function get_template_mapping_object

end # End of module
