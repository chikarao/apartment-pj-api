class CreateDocumentFieldTranslations < ActiveRecord::Migration[5.1]
  def change
    create_table :document_field_translations do |t|
      t.references :document_field, foreign_key: true
      t.string :language_code
      t.string :value

      t.timestamps
    end

    add_column :document_fields, :translation_element, :boolean, default: false
  end
end
