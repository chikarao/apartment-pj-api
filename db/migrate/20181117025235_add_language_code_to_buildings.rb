class AddLanguageCodeToBuildings < ActiveRecord::Migration[5.1]
  def change
    add_column :buildings, :language_code, :string
  end
end
