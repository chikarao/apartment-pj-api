module TemplateElementFunctions

  def get_template_object(translation, base)
    # Function to get hash object like { flat: { address: object },
    # document: { date: { year: object, month: object, day: object }}}
    # from ImportantPointsExplanationBilingualAll and FixedTermRentalContractBilingualAll
    # with translation objects DocumentTranslationFixedTermAll and DocumentTranslationImportantPointsAll
    # called in BookingsController#show
    # count = 0
    object = {}
    # p "!!!!! booking_controller TemplateElementFunctions, create object, called: "
    base.keys.each do |each|
      # count += 1
      if base[each][:translation_key] && base[each][:category]
        p "!!!!! booking_controller TemplateElementFunctions, create object, each, base[each][:translation_key] base[each][:category]: " + each.to_s + ' ' + base[each][:translation_key].to_s + ' ' + base[each][:category].class.to_s
        base[each][:translation] = translation[base[each][:translation_key].to_sym][:translations]
        base[each][:examples] = translation[base[each][:translation_key].to_sym][:examples]

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

      end # End of if base[each][:translation_key] && base[each][:category]
    end# End of each base.keys
    # p "!!!!! booking_controller  template_element_functions, translation[base[each][:translation_key]]: " + translation[base[each][:translation_key]].to_s
    # p "!!!!! booking_controller TemplateElementFunctions, count: " + count.to_s
    return object
  end # End of function get_template_object

end # End of module
