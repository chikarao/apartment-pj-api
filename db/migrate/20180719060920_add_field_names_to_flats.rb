class AddFieldNamesToFlats < ActiveRecord::Migration[5.1]
  def change
    add_column :flats, :size, :float
    add_column :flats, :balcony_size, :float
    add_column :flats, :station, :string
    add_column :flats, :minutes_to_station, :float
    add_column :flats, :station1, :string
    add_column :flats, :minutes_to_station1, :float
    add_column :flats, :floor, :integer
    add_column :flats, :deposit, :float, :default => 0
    add_column :flats, :key_money, :float, :default => false
    add_column :flats, :year_built, :integer, :default => 0
    add_column :flats, :construction, :string
    add_column :flats, :management_fees, :float, :default => 0
    add_column :flats, :fees, :float, :default => 0
    add_column :flats, :parking_available, :boolean
    add_column :flats, :parking_included, :boolean
    add_column :flats, :parking_price, :float, :default => 0
    add_column :flats, :school_district, :string
    add_column :flats, :school_district1, :string
  end
end
