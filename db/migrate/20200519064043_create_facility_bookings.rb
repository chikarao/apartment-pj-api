class CreateFacilityBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :facility_bookings do |t|
      t.references :booking, foreign_key: true
      t.references :facility, foreign_key: true
      t.references :user, foreign_key: true
      t.float :price_per_month
      t.date :date_start
      t.date :date_end
      t.float :discount
      t.float :facility_deposit
      t.float :facility_key_money
      t.float :facility_management_fees
      t.float :facility_broker_fees

      t.timestamps
    end
  end
end
