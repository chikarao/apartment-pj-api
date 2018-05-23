class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :conversation, foreign_key: true
      t.text :body
      t.string :subject
      t.boolean :read, default: false
      t.boolean :replied, default: false
      t.boolean :flag, default: false
      t.string :folder

      t.timestamps
    end
  end
end
