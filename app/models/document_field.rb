class DocumentField < ApplicationRecord
  belongs_to :agreement
  has_many :document_field_choices, dependent: :destroy

  accepts_nested_attributes_for :document_field_choices
end
