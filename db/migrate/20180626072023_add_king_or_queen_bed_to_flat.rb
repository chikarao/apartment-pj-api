class AddKingOrQueenBedToFlat < ActiveRecord::Migration[5.1]
  def change
    add_column :flats, :king_or_queen_bed, :integer, :default => 0
  end
end
