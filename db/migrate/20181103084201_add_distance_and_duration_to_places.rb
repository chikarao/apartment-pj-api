class AddDistanceAndDurationToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :distance, :integer
    add_column :places, :duration, :integer
  end
end
