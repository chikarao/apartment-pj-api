class AddPhoneAndEmergencyContactColumnsToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :phone, :string
    add_column :profiles, :emergency_contact_name, :string
    add_column :profiles, :emergency_contact_address, :string
    add_column :profiles, :emergency_contact_phone, :string
    add_column :profiles, :emergency_contact_relationship, :string
  end
end
