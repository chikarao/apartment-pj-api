class DocumentField < ApplicationRecord
  belongs_to :agreement
  has_many :document_field_choices, dependent: :destroy
  has_many :document_field_translations, dependent: :destroy

  # Enables creation and update of document_fields_choices simultaneously
  # when agreement created and updated; Need to specify in params "document_field_choices_attributes"
  accepts_nested_attributes_for :document_field_choices
  accepts_nested_attributes_for :document_field_translations
end
