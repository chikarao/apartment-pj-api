class DocumentFieldChoiceSerializer < ActiveModel::Serializer
  attributes :id,
  :id,
  :document_field_id,
  :val,
  :valName,
  :top,
  :left,
  :width,
  :height,
  :class_name,
  :border_radius,
  :border,
  :border_color,
  :border_width,
  :border_style,
  :underline,
  :margin,
  :text_align,
  :background_color,
  :font_style,
  :font_size,
  :font_color,
  :font_weight,
  :font_family,
  :input_type,
  :translation,
  # select_choices returned in custom serializer in agreement serializer
  # :select_choices,
  :created_at,
  :updated_at
  # has_many :flats
  # has_many :inspections
  belongs_to :document_field
  # has_many :select_choices, include: :all

  # def select_choices
  #   # Return hash object of document_field_choices mapped; Nil if no document_field_choices
  #   obj = nil
  #   # Object is a DocumentField instance
  #   p "In document_field_choice serializer in def: " + object.to_s
  #   if !object.select_choices.empty?
  #     obj = {}
  #     # object is a DocumentField instance
  #     object.select_choices.each_with_index do |each,  i|
  #       obj[i] = each
  #     end
  #   end
  #   return obj
  # end # End of function
end
