class AddCorporateColumnsToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :corporation, :boolean, :default => false
    add_column :profiles, :contact_name, :string
  end
end
