class CreateFacilities < ActiveRecord::Migration[5.1]
  def change
    create_table :facilities do |t|
      t.references :flat, foreign_key: true
      t.references :booking, foreign_key: true
      t.boolean :optional
      t.string :facility_type
      t.float :price_per_month
      t.float :discount
      t.string :facility_number

      t.timestamps
    end
  end
end
