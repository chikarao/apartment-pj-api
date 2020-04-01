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
  :created_at,
  :updated_at
  # has_many :flats
  # has_many :inspections
  belongs_to :document_field
end
