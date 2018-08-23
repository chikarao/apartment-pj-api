class CreateFlatLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :flat_languages do |t|
      t.string :code
      t.references :flat, foreign_key: true
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :region
      t.string :country
      t.string :area
      t.string :sales_point
      t.string :description
      t.string :flat_type
      t.text :intro
      t.string :cancellation
      t.string :construction
      t.string :school_district
      t.string :school_district1
      t.string :station
      t.string :station1

      t.timestamps
    end
  end
end
