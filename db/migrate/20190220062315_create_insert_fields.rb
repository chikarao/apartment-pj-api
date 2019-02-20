class CreateInsertFields < ActiveRecord::Migration[5.1]
  def change
    create_table :insert_fields do |t|
      t.references :document_insert, foreign_key: true
      t.string :name
      t.text :value
      t.string :language_code

      t.timestamps
    end
  end
end
