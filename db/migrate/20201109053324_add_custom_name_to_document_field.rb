class AddCustomNameToDocumentField < ActiveRecord::Migration[5.1]
  def change
    add_column :document_fields, :custom_name, :text
  end
end
