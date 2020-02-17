class AddFontWeightToDocumentField < ActiveRecord::Migration[5.1]
  def change
    add_column :document_fields, :font_weight, :string
  end
end
