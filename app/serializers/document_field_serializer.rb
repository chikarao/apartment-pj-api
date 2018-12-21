class DocumentFieldSerializer < ActiveModel::Serializer
  attributes :id,
    :name,
    :agreement_id,
    :input_type,
    :text_align,
    :page,
    :val,
    :value,
    :enclosed_text,
    :top,
    :left,
    :width,
    :height,
    :font_size,
    :margin,
    :class_name,
    :class_name_1,
    :component_type,
    :component_name,
    :display_text,
    :created_at,
    :updated_at
  # has_many :flats
  # has_many :inspections
end
