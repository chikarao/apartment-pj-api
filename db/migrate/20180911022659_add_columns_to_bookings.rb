class AddColumnsToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :booking_by_owner, :boolean, :default => false
    add_column :bookings, :approved, :boolean, :default => false
    add_column :bookings, :final_rent, :float
    add_column :bookings, :adjustments, :float
    add_column :bookings, :fees, :float
    add_column :bookings, :taxes, :float
    add_column :bookings, :total_price, :float
    add_column :bookings, :final_deposit, :float
    add_column :bookings, :paid, :boolean, :default => false
    add_column :bookings, :special_requests, :text
  end
end
