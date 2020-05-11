class AddListParametersToDocumentFieldChoices < ActiveRecord::Migration[5.1]
  def change
    add_column :document_field_choices, :list_parameters, :string
  end
end
