class AddRegistrationPrefectureToStaffs < ActiveRecord::Migration[5.1]
  def change
    add_column :staffs, :registration_jurisdiction, :string
    add_column :contractors, :registration_jurisdiction, :string
    add_column :contractors, :registration_grantor, :string
    add_column :contractors, :registration_number_front, :string
  end
end
