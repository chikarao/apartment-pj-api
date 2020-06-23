class DocumentInsertSerializer < ActiveModel::Serializer
  attributes :id,
  :agreement_id,
  :publicid,
  :result,
  :main_agreement,
  :insert_after_page,
  :pages,
  :from_page,
  :to_page,
  :insert_name,
  :insert_fields,
  :page_size,
  :created_at,
  :updated_at

  has_many :insert_fields
  # has_many :inspections
end
