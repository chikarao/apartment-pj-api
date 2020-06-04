class DocumentFieldTranslationSerializer < ActiveModel::Serializer
  attributes :id,
  :value,
  :language_code,
  :created_at,
  :updated_at

  belongs_to :document_field

end
