class AddBuildingOwnerColumnsToBuildingLanguages < ActiveRecord::Migration[5.1]
  def change
    add_column :building_languages, :building_owner_name, :string
    add_column :building_languages, :building_owner_address, :string
  end
end
