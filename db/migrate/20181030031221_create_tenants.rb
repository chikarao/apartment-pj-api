class CreateTenants < ActiveRecord::Migration[5.1]
  def change
    create_table :tenants do |t|
      t.references :user, foreign_key: true
      t.references :booking, foreign_key: true
      t.string :name
      t.integer :age
      t.string :phone
      t.string :email
      t.string :identification
      t.string :corporate_identification

      t.timestamps
    end
  end
end
