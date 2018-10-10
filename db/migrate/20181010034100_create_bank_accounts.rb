class CreateBankAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :bank_accounts do |t|
      t.references :user, foreign_key: true
      t.string :account_first_name
      t.string :account_last_name
      t.string :account_name
      t.string :bank_name
      t.string :branch_name
      t.string :bank_address
      t.string :branch_number
      t.string :account_number
      t.string :account_type
      t.string :routing_number
      t.string :swift

      t.timestamps
    end
  end
end
