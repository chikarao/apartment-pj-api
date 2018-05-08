class AddColumnsToFlat < ActiveRecord::Migration[5.1]
  def change
    add_column :flats, :intro, :text
    add_column :flats, :state, :string
    add_column :flats, :region, :string
    add_column :flats, :address2, :string
    add_column :flats, :cancellation, :string
    add_column :flats, :smoking, :booleancheckin
  end
end
