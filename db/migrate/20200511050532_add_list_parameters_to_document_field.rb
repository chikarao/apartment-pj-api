class AddListParametersToDocumentField < ActiveRecord::Migration[5.1]
  def change
    add_column :document_fields, :list_parameters, :string
  end
end
