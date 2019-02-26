class AddColumnsToAgreementsBuildingsEtc < ActiveRecord::Migration[5.1]
  def change
    add_column :agreements, :document_pages, :integer
    add_column :buildings, :electricity, :string
    add_column :building_languages, :electricity, :string
    add_column :buildings, :building_management_address, :string
    add_column :building_languages, :building_management_address, :string
    add_column :contractors, :bond_deposit_office, :string
    add_column :contractors, :bond_deposit_office_address, :string
    add_column :contractors, :guaranty_association_name, :string
    add_column :contractors, :guaranty_association_address, :string
    add_column :contractors, :guaranty_association_office_address, :string
    add_column :staffs, :registration_number, :string
    add_column :staffs, :staff_number, :string
    # add_column :inspections, :architect_office_registration, :string
    add_column :inspections, :architect_office_registration_jurisdiction, :string
    # add_column :inspections, :architect_registration, :string
    add_column :inspections, :architect_registration_jurisdiction, :string
    add_column :inspections, :halls, :string

    # columns = [:foundation, :floor_assembly, :floor, :pillars, :exterior_walls, :balcony, :interior_walls, :ceilings, :roof_truss, :termite_damage, :corrosion, :reinforcement, :concrete_compression, :exterior_walls_rain, :eaves_rain, :balcony_rain, :interior_walls_rain, :ceilings_rain, :roof_truss_rain, :roof]
    # columns.each do |column|
    #   change_column_default(:inspections, column, false)
    # end
    # columns = [:tenant_signed, :owner_signed, :contractor_signed, :sent_to_tenant, :owner_approved, :tenant_approved, :contractor_approved]
    # columns.each do |each|
    #   change_column_default(:agreements, each, false)
    # end
  end
end
