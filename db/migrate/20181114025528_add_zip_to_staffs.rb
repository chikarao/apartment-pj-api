class AddZipToStaffs < ActiveRecord::Migration[5.1]
  def change
    add_column :staffs, :zip, :string
  end
end
