class CreateViews < ActiveRecord::Migration[5.1]
  def change
    create_table :views do |t|
      t.references :user, foreign_key: true
      t.references :flat, foreign_key: true
      t.string :device
      t.string :location

      t.timestamps
    end
  end
end
