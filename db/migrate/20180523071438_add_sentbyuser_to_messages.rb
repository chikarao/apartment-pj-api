class AddSentbyuserToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :sent_by_user, :boolean
  end
end
