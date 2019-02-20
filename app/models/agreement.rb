class Agreement < ApplicationRecord
  belongs_to :booking, optional: true
  belongs_to :flat, optional: true

  has_many :document_fields, dependent: :destroy
  has_many :document_inserts, dependent: :destroy

  accepts_nested_attributes_for :document_fields
end
