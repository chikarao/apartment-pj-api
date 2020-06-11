class AddTranslationToDocumentField < ActiveRecord::Migration[5.1]
  def change
    add_column :document_fields, :translation, :boolean, default: false
  end
end
