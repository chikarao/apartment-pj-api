class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :image
      t.string :identification
      t.string :title
      t.string :name
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :username
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :region
      t.string :country
      t.string :language
      t.date :birthday
      t.string :gender
      t.text :introduction

      t.timestamps
    end
  end
end
