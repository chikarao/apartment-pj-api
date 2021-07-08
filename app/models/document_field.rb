class DocumentField < ApplicationRecord
  belongs_to :agreement
  has_many :document_field_choices, dependent: :destroy
  has_many :document_field_translations, dependent: :destroy

  # Enables creation and update of document_fields_choices simultaneously
  # when agreement created and updated; Need to specify in params "document_field_choices_attributes"
  accepts_nested_attributes_for :document_field_choices
  accepts_nested_attributes_for :document_field_translations

  # scope :limit_pages, ->(pages_array) { where("page = ?", pages_array) }

  scope :limit_pages, lambda {|pages_array|
    # p "!!!! In document_field model agreements_test, limit_pages self: " + self.to_s
    where("page = ?", pages_array)
  }

end
