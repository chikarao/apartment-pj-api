class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.references :flat, foreign_key: true
      t.string :publicid
      t.string :url

      t.timestamps
    end
  end
end
