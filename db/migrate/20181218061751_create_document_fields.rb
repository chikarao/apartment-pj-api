class CreateDocumentFields < ActiveRecord::Migration[5.1]
  def change
    create_table :document_fields do |t|
      t.string :field_name
      t.references :agreement, foreign_key: true
      t.string :val
      t.string :value
      t.string :enclosed_text
      t.string :top
      t.string :left
      t.string :height
      t.string :font_style
      t.string :font_size
      t.string :font_color
      t.string :font
      t.string :border_color
      t.string :border_width
      t.string :border_style
      t.boolean :underline
      t.boolean :italic
      t.string :background_color
      t.string :margin
      t.string :class_name
      t.string :class_name_1
      t.string :component_type
      t.string :component_name
      t.string :model_name

      t.timestamps
    end
  end
end
