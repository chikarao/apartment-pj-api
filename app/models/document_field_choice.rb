class DocumentFieldChoice < ApplicationRecord
  belongs_to :document_field

  has_many :select_choices, dependent: :destroy

  accepts_nested_attributes_for :select_choices
end
