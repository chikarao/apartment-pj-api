class AddPaymentDueDateAndBankAccountIdToFlats < ActiveRecord::Migration[5.1]
  def change
    add_column :flats, :payment_due_date, :integer
    add_reference :flats, :bank_account, foreign_key: true
  end
end
