class AddColumnToConversations < ActiveRecord::Migration[5.1]
  def change
    add_column :conversations, :deleted_by_user, :boolean, :default => false
  end
end
