class AddColumnsToConversations < ActiveRecord::Migration[5.1]
  def change
    add_column :conversations, :trashed, :boolean, :default => false
    add_column :conversations, :deleted, :boolean, :default => false
    add_column :conversations, :archived, :boolean, :default => false
    add_column :conversations, :flagged, :boolean, :default => false
    add_column :conversations, :starred, :boolean, :default => false
    add_column :conversations, :important, :boolean, :default => false
    add_column :conversations, :office, :boolean, :default => false
  end
end
