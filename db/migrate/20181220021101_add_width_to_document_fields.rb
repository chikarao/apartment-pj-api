class AddWidthToDocumentFields < ActiveRecord::Migration[5.1]
  def change
      add_column :document_fields, :width, :string
      add_column :document_fields, :display_text, :string
  end
end
