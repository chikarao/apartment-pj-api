class CreateStaffs < ActiveRecord::Migration[5.1]
  def change
    create_table :staffs do |t|
      t.references :contractor, foreign_key: true
      t.references :user, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :identification
      t.string :tax_identification
      t.date :birthday
      t.string :title
      t.string :division
      t.string :group
      t.boolean :representative, default: false
      t.boolean :manager, default: false
      t.decimal :salary, precision: 8, scale: 2
      t.decimal :bonus, precision: 8, scale: 2
      t.float :bonus_months
      t.string :contract
      t.string :registration
      t.string :registration_type
      t.string :stamp
      t.string :mobile
      t.string :phone
      t.string :fax
      t.string :email
      t.string :line
      t.float :lat
      t.float :lng
      t.string :location_name
      t.string :location_number
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :region
      t.string :country
      t.string :calendar

      t.timestamps
    end
  end
end
