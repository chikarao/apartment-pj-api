class AddTranslationToDocumentFieldChoices < ActiveRecord::Migration[5.1]
  def change
    add_column :document_field_choices, :translation, :boolean, default: false
  end
end
