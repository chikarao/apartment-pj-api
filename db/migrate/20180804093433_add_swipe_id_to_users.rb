class AddSwipeIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :swipe_customer_id, :string
  end
end
