class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.references :flat, foreign_key: true
      t.float :lat
      t.float :lng
      t.string :placeid
      t.string :place_name

      t.timestamps
    end
  end
end
