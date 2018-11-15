class AddBaseIdToContractorsAndStaff < ActiveRecord::Migration[5.1]
  def change
    tables = [:staffs, :contractors]
    tables.each do |table_name|
      add_column table_name, :base_record_id, :integer
    end
  end
end
