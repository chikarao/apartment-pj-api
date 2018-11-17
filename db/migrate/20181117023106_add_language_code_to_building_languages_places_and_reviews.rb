class AddLanguageCodeToBuildingLanguagesPlacesAndReviews < ActiveRecord::Migration[5.1]
  def change
    tables = [:building_languages, :reviews, :places]
    tables.each do |table_name|
      add_column table_name, :language_code, :string
    end
  end
end
