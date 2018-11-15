class AddLanguageCodeToContractorsStaffAndProfile < ActiveRecord::Migration[5.1]
  def change
    tables = [:profiles, :staffs, :contractors, :inspections]
    tables.each do |table_name|
      add_column table_name, :language_code, :string
    end
  end
end
