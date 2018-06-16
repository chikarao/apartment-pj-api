class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :flat, foreign_key: true
      t.string :title
      t.text :comment
      t.float :rating
      t.float :average_rating
      t.boolean :review_for_flat, :default => false
      t.boolean :review_for_user, :default => false
      t.boolean :review_for_site, :default => false
      t.integer :helpful

      t.timestamps
    end
  end
end
