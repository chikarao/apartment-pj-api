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
  :document_field_choices,
  :created_at,
  :updated_at
  # has_many :flats
  # has_many :inspections
  has_many :document_field_choices, include: :all

  def document_field_choices
    obj = nil
    if !object.document_field_choices.empty?
      obj = {}
      p "In document_field_serializer in def: " + object.to_s
      # object is a DocumentField instance
      object.document_field_choices.each_with_index do |each,  i|
        obj[i] = each
      end
    end
    return obj
  end
  # ["id", "agreement_id", "val", "value", "enclosed_text", "top", "left", "height", "font_style", "font_size", "font_color", "font", "border_color", "border_width", "border_style", "underline", "italic", "background_color", "margin", "class_name", "class_name_1", "component_type", "component_name", "created_at", "updated_at", "name", "text_align", "input_type", "page", "width", "display_text", "font_family", "component", "font_weight"]

end
