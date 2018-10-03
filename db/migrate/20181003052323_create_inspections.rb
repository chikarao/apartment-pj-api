class CreateInspections < ActiveRecord::Migration[5.1]
  def change
    create_table :inspections do |t|
      t.references :building, foreign_key: true
      t.datetime :inspection_date
      t.text :inspection_summary
      t.string :inspector_name
      t.string :inspector_trainer
      t.string :inspector_certificate_number
      t.string :architect_qualification_type
      t.string :architect_type
      t.string :architect_registration_number
      t.string :architect_registration_type
      t.string :architect_office_name
      t.string :architect_office_registration
      t.string :foundation
      t.string :floor_assembly
      t.string :floor
      t.string :pillars
      t.string :exterior_walls
      t.string :balcony
      t.string :interior_walls
      t.string :ceilings
      t.string :roof_truss
      t.string :termite_damage
      t.string :corrosion
      t.string :reinforcement
      t.string :concrete_compression
      t.string :exterior_walls_rain
      t.string :eaves_rain
      t.string :balcony_rain
      t.string :interior_walls_rain
      t.string :ceilings_rain
      t.string :roof_truss_rain
      t.string :roof

      t.timestamps
    end
  end
end
