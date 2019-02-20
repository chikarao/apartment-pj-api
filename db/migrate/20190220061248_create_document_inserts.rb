class CreateDocumentInserts < ActiveRecord::Migration[5.1]
  def change
    create_table :document_inserts do |t|
      t.references :agreement, foreign_key: true
      t.string :publicid
      t.text :result
      t.boolean :main_agreement, default: true
      t.integer :insert_after_page
      t.integer :pages
      t.integer :from_page
      t.integer :to_page
      t.string :insert_name

      t.timestamps
    end
  end
end
