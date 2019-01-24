class AddLanguageCodeToFlatLanguages < ActiveRecord::Migration[5.1]
  def change
    add_column :flat_languages, :language_code, :string
  end
end
