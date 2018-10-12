class AddTransferFeePaidByAndRentPaymentMethodAndManagementFeeDueDateToFlats < ActiveRecord::Migration[5.1]
  def change
    add_column :flats, :transfer_fee_paid_by, :string
    add_column :flats, :rent_payment_method, :string
    add_column :flats, :management_fee_due_date, :integer
  end
end
