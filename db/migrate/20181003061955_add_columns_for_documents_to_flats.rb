class AddColumnsForDocumentsToFlats < ActiveRecord::Migration[5.1]
  def change
    add_reference :flats, :building, foreign_key: true
    add_column :flats, :layout, :string
    add_column :flats, :bicycle_parking_included, :boolean
    add_column :flats, :storage_included, :boolean
    add_column :flats, :motorcycle_parking_included, :boolean
    add_column :flats, :dedicated_yard, :boolean
    add_column :flats, :toilet, :string
    add_column :flats, :floor_area_official, :float
    add_column :flats, :owner_name, :string
    add_column :flats, :owner_contact_name, :string
    add_column :flats, :owner_address, :string
    add_column :flats, :owner_phone, :string
  end
end
