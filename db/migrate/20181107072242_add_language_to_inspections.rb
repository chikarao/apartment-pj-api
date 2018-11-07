class AddLanguageToInspections < ActiveRecord::Migration[5.1]
  def change
    add_column :inspections, :inspection_language, :string
  end
end
