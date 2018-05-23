class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.references :user, foreign_key: true
      t.references :flat, foreign_key: true
      t.date :date_start
      t.date :date_end
      t.integer :guests
      t.integer :booking_id

      t.timestamps
    end
  end
end
