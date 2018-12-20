class AddAndRemoveDocumentFieldsColumns < ActiveRecord::Migration[5.1]
  def change
    remove_column :document_fields, :field_name
    add_column :document_fields, :name, :string
    add_column :document_fields, :text_align, :string
    add_column :document_fields, :input_type, :string
    add_column :document_fields, :page, :integer
  end
end
