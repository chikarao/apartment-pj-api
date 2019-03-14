class AddSignedAndFinalColumnsToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :final_key_money, :float
    add_column :bookings, :booking_by_owner_notes, :string
    add_column :bookings, :booking_by_ical_notes, :string
    add_column :bookings, :signed, :boolean, default: false
    add_column :bookings, :tenant_approved, :boolean, default: false
    add_column :bookings, :parking_included, :boolean, default: false
    add_column :bookings, :bicycle_parking_included, :boolean, default: false
    add_column :bookings, :motorcycle_parking_included, :boolean, default: false
    add_column :bookings, :storage_included, :boolean, default: false
    add_column :images, :caption, :string
    add_column :images, :comment, :string
  end
end
