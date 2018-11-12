class CreateContracts < ActiveRecord::Migration[5.1]
  def change
    create_table :contracts do |t|
      t.references :flat, foreign_key: true
      t.references :booking, foreign_key: true
      t.references :contractor, foreign_key: true
      t.string :work_type
      t.string :work_sub_type
      t.decimal :contract_price, precision: 8, scale: 2
      t.decimal :total_price, precision: 8, scale: 2
      t.decimal :taxes, precision: 8, scale: 2
      t.decimal :fees, precision: 8, scale: 2
      t.decimal :adjustments, precision: 8, scale: 2
      t.boolean :paid, default: false
      t.text :special_requests
      t.boolean :approved, default: false
      t.boolean :contract_by_ical, default: false
      t.boolean :contract_by_self, default: false
      t.datetime :date_from
      t.datetime :date_to

      t.timestamps
    end
  end
end
