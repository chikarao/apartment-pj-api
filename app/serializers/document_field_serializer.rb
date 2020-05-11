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
  # document_field_choices return in custom serializer in agreement serializer 
  # :document_field_choices,
  :created_at,
  :updated_at
  # has_many :flats
  # has_many :inspections
  # has_many :document_field_choices, include: :all

  # IMPORTANT: Below is a custom document_field serializer that returns document_field_choices
  # place document_field_choices in a hash mapped by index { 0: obj, 1: obj }
  # def document_field_choices
  #   # Return hash object of document_field_choices mapped; Nil if no document_field_choices
  #   obj = nil
  #   # Object is a DocumentField instance
  #   if !object.document_field_choices.empty?
  #     obj = {}
  #     p "In document_field_serializer in def: " + object.to_s
  #     # object is a DocumentField instance
  #     object.document_field_choices.each_with_index do |each,  i|
  #       if each.select_choices
  #         each["select_choices"] = {}
  #         each.select_choices.each_with_index do |eachSelect, i|
  #           each[select_choices][i] = eachSelect
  #         end
  #       end
  #       obj[i] = each
  #     end
  #   end
  #   return obj
  # end # End of function

end # End of class
