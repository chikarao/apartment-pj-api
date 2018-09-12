class AddColumnToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :booking_by_ical, :boolean, :default => false
  end
end
