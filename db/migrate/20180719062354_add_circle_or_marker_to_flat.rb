class AddCircleOrMarkerToFlat < ActiveRecord::Migration[5.1]
  def change
    add_column :flats, :circle_no_marker, :boolean, :default => false
  end
end
