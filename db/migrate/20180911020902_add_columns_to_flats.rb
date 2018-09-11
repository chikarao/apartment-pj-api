class AddColumnsToFlats < ActiveRecord::Migration[5.1]
  def change
    add_column :flats, :ical_import_url, :string
    add_column :flats, :ical_export_url, :string
    add_column :flats, :snoozing, :boolean, :default => false
    add_column :flats, :approval_required, :boolean, :default => true
    add_column :flats, :min_stay, :integer
    add_column :flats, :max_stay, :integer
    add_column :flats, :block, :string
    add_column :flats, :unit, :string
    add_column :flats, :flat_building_name, :string
  end
end
