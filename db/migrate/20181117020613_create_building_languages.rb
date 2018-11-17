class CreateBuildingLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :building_languages do |t|
      t.references :building, foreign_key: true
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :region
      t.string :country
      t.string :construction
      t.string :building_type
      t.string :building_management_company
      t.string :building_management_contact
      t.text :asbestos_survey_contents
      t.text :earthquake_study_contents

      t.timestamps
    end
  end
end
