class AddLanguageCodeToFlats < ActiveRecord::Migration[5.1]
  def change
    add_column :flats, :language_code, :string, :default => 'en'
  end
end
  
