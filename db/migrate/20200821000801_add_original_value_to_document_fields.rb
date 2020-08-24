class AddOriginalValueToDocumentFields < ActiveRecord::Migration[5.1]
  def change
    add_column :document_fields, :original_value, :text
    # change_column :document_fields, :value, :text
  end

# def up
#      change_column :document_fields, :value, :text
#  end
#
#  def down
#      change_column :document_fields, :value, :string
#  end
end
