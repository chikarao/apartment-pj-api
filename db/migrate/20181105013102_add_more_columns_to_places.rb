class AddMoreColumnsToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :language, :string, :default => 'en'
    add_column :places, :address, :string
    add_column :places, :image, :string
    add_column :places, :image_height, :integer
    add_column :places, :image_width, :integer
    add_column :places, :icon, :string
    add_column :places, :vicinity, :string
    add_column :places, :hours, :string
  end
end
