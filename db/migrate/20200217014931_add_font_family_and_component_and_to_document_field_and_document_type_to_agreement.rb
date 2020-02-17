class AddFontFamilyAndComponentAndToDocumentFieldAndDocumentTypeToAgreement < ActiveRecord::Migration[5.1]
  def change
    add_column :document_fields, :font_family, :string
    add_column :document_fields, :component, :string
    add_column :agreements, :document_type, :string
  end
end
