class AddOwnerColumnsToFlatLanguages < ActiveRecord::Migration[5.1]
  def change
    add_column :flat_languages, :owner_name, :string
    add_column :flat_languages, :owner_contact_name, :string
    add_column :flat_languages, :owner_address, :string
  end
end
