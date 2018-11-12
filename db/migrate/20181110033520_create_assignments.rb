class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.references :contract, foreign_key: true
      t.references :staff, foreign_key: true
      t.boolean :staff_approved, default: false
      t.boolean :staff_finished, default: false
      t.boolean :finished, default: false
      t.decimal :taxes, precision: 8, scale: 2
      t.decimal :fees, precision: 8, scale: 2
      t.decimal :adjustments, precision: 8, scale: 2
      t.decimal :total_pay, precision: 8, scale: 2
      t.boolean :paid, default: false
      t.string :role
      t.boolean :leader, default: false
      t.boolean :assignment_by_ical, default: false
      t.boolean :assignment_by_self, default: false
      t.datetime :date_from
      t.datetime :date_to

      t.timestamps
    end
  end
end
