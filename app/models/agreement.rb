class Agreement < ApplicationRecord
  belongs_to :booking, optional: true
  # belongs_to :booking, optional: true
  belongs_to :flat, optional: true

  has_many :document_fields, dependent: :destroy
  has_many :document_inserts, dependent: :destroy

  # Enables creation and update of document_fields simultaneously
  # when agreement created and updated; Need to specify in params "document_field_attributes"
  accepts_nested_attributes_for :document_fields
end
