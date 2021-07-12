class AddStandardDocumentColumnToAgreement < ActiveRecord::Migration[5.1]
  def change
    add_column :agreements, :standard_document, :boolean, default: false
  end
end
