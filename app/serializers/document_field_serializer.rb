class DocumentFieldSerializer < ActiveModel::Serializer
  attributes :id,
  :field_name,
  :agreement_id,
  :val,
  :value,
  :enclosed_text,
  :top,
  :left,
  :height,
  :font_size,
  :margin,
  :class_name,
  :class_name_1,
  :component_type,
  :component_name,
  :created_at,
  :updated_at
  # :font_style,
  # :font_color,
  # :font,
  # :border_color,
  # :border_width,
  # :border_style,
  # :underline,
  # :italic,
  # :background_color,
  # has_many :flats
  # has_many :inspections

  # !!!!!!add building_type to replace type; does not show up in serialized results
end
