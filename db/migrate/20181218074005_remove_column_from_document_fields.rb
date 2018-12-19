class RemoveColumnFromDocumentFields < ActiveRecord::Migration[5.1]
  def change
    remove_column :document_fields, :model_name
  end
end
