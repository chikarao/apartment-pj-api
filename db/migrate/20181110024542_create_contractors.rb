class CreateContractors < ActiveRecord::Migration[5.1]
  def change
    create_table :contractors do |t|
      t.references :user, foreign_key: true
      t.string :contractor_type
      t.string :contractor_sub_type
      t.string :contractor_sales_heading
      t.string :contractor_intro
      t.decimal :price, precision: 8, scale: 2
      t.float :price_range
      t.string :days_closed
      t.integer :time_from
      t.integer :time_to
      t.string :specialty
      t.string :phone
      t.string :mobile
      t.string :email
      t.string :company_name
      t.string :registration_number
      t.string :registration_type
      t.date :registration_date
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :stamp
      t.string :fax
      t.string :facebook
      t.string :twitter
      t.string :line
      t.string :image
      t.string :url
      t.float :lat
      t.float :lng
      t.string :address1
      t.string :address2
      t.string :city
      t.string :zip
      t.string :state
      t.string :region
      t.string :country

      t.timestamps
    end
  end
end
