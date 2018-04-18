class CreateFlats < ActiveRecord::Migration[5.1]
  def change
    create_table :flats do |t|
      t.references :user, foreign_key: true
      t.float :lat
      t.float :lng
      t.string :address1
      t.string :address1
      t.string :city
      t.string :zip
      t.string :country
      t.string :area
      t.decimal :price_per_day, precision: 8, scale: 2
      t.decimal :price_per_month, precision: 8, scale: 2
      t.integer :guests
      t.string :sales_point
      t.text :description
      t.integer :rooms
      t.string :beds
      t.string :flat_type
      t.float :bath

      t.timestamps
    end
  end
end
