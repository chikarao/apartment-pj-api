class RemoveForeignKey < ActiveRecord::Migration[5.1]
  def change
    # remove the old foreign_key
   remove_foreign_key :bank_accounts, :flats
  end
end
