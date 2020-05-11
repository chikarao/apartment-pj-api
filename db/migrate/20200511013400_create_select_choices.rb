class CreateSelectChoices < ActiveRecord::Migration[5.1]
  def change
    create_table :select_choices do |t|
      t.string :value
      t.string :val
      t.references :document_field_choice, foreign_key: true

      t.timestamps
    end
  end
end
