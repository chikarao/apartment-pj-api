class InsertFieldSerializer < ActiveModel::Serializer
  attributes :id,
  :document_insert_id,
  :name,
  :value,
  :language_code,
  :created_at,
  :updated_at
  # has_many :flats
  # has_many :inspections
  belongs_to :document_insert
end
