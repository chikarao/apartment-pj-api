class AddColumnsToConversation < ActiveRecord::Migration[5.1]
  def change
    add_column :conversations, :trashed_by_user, :boolean, :default => false
    add_column :conversations, :starred_by_user, :boolean, :default => false
    add_column :conversations, :flagged_by_user, :boolean, :default => false
    add_column :conversations, :important_by_user, :boolean, :default => false
    add_column :conversations, :archived_by_user, :boolean, :default => false
  end
end
