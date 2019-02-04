class AddOwnershipRightsAndLegalRestrictions < ActiveRecord::Migration[5.1]
  def change
    add_column :flats, :ownership_rights, :text
    add_column :flats, :other_rights, :text
    add_column :flat_languages, :ownership_rights, :text
    add_column :flat_languages, :other_rights, :text
    add_column :buildings, :legal_restrictions, :string
    add_column :buildings, :legal_restrictions_summary, :text
    add_column :building_languages, :legal_restrictions, :string
    add_column :building_languages, :legal_restrictions_summary, :text
  end
end
