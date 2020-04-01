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
  :document_field_choices
  :created_at,
  :updated_at
  # has_many :flats
  # has_many :inspections
  has_many :document_field_choices, include: :all

  # ["id", "agreement_id", "val", "value", "enclosed_text", "top", "left", "height", "font_style", "font_size", "font_color", "font", "border_color", "border_width", "border_style", "underline", "italic", "background_color", "margin", "class_name", "class_name_1", "component_type", "component_name", "created_at", "updated_at", "name", "text_align", "input_type", "page", "width", "display_text", "font_family", "component", "font_weight"]

end
