class CreateBuildings < ActiveRecord::Migration[5.1]
  def change
    create_table :buildings do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :region
      t.string :country
      t.string :construction
      t.string :type
      t.integer :year_built
      t.integer :last_renovation_year
      t.integer :units
      t.integer :floors
      t.integer :floors_underground
      t.integer :power_usage_amount
      t.string :gas
      t.string :water
      t.string :sewage
      t.string :building_management_company
      t.string :building_management_phone
      t.string :building_management_contact
      t.boolean :building_inspection_conducted
      t.boolean :inside_disaster_prevention
      t.boolean :inside_disaster_warning
      t.boolean :inside_tsunami_warning
      t.boolean :asbestos_record
      t.text :asbestos_survey_contents
      t.boolean :earthquake_study_performed
      t.text :earthquake_study_contents

      t.timestamps
    end
  end
end
