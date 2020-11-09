class DocumentFieldSerializer < ActiveModel::Serializer

  attributes :id,
  :agreement_id,
  :name,
  :val,
  :value,
  :enclosed_text,
  :top,
  :left,
  :height,
  :width,
  :font_style,
  :font_family,
  :font_size,
  :font_color,
  :font_weight,
  :font,
  :border_color,
  :border_width,
  :border_style,
  :underline,
  :italic,
  :background_color,
  :margin,
  :class_name,
  :class_name_1,
  :component_type,
  :component_name,
  :component,
  :page,
  :input_type,
  :list_parameters,
  :transform,
  :transform_origin,
  # document_field_choices return in custom serializer in agreement serializer
  :document_field_choices,
  :document_field_translations,
  :translation_element,
  :translation,
  :original_value,
  :custom_name,
  :created_at,
  :updated_at
  # has_many :flats
  # has_many :inspections
  # has_many :document_field_choices, include: :all

  # IMPORTANT: Below is a custom document_field serializer that returns document_field_choices
  # place document_field_choices in a hash mapped by index { 0: obj, 1: obj }
  def document_field_choices
    # Return hash object of document_field_choices mapped; Nil if no document_field_choices
    obj = nil
    # Object is a DocumentField instance
    if !object.document_field_choices.empty?
      obj = {}
      # p "In document_field_serializer in def: " + object.to_s
      # object is a DocumentField instance
      object.document_field_choices.each_with_index do |each,  i|
        custom_each = each.attributes
        if !each.select_choices.empty?
          custom_each["select_choices"] = {}
          each.select_choices.each_with_index do |each_select, i|
            custom_each["select_choices"][i] = each_select
          end
        end
        obj[i] = custom_each
      end
    end # end of if !object.document_field_choices.empty?
    return obj
  end # End of function

  def document_field_translations
    # Return hash object of document_field_translations mapped; Nil if no document_field_translations
    obj = nil
    # Object is a DocumentField instance
    if !object.document_field_translations.empty?
      obj = {}
      # p "In document_field_serializer in def: " + object.to_s
      # object is a DocumentField instance
      object.document_field_translations.each do |each|
        custom_each = each.attributes
        # put them in a hash like { en: each, jp: each }
        obj[each.language_code] = custom_each
      end
    end # end of if !object.document_field_translations.empty?
    return obj
  end # End of function

end # End of class
