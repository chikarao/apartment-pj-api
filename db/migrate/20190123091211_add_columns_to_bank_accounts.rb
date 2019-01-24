class AddColumnsToBankAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :bank_accounts, :bank_name_english, :string
    add_column :bank_accounts, :account_name_english, :string
  end
end
