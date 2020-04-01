class CreateDocumentFieldChoices < ActiveRecord::Migration[5.1]
  def change
    create_table :document_field_choices do |t|
      t.references :document_field, foreign_key: true
      t.string :val
      t.string :valName
      t.string :top, default: nil
      t.string :left, default: nil
      t.string :width, default: nil
      t.string :height, default: nil
      t.string :class_name
      t.string :border_radius
      t.string :border
      t.string :border_color
      t.string :border_width
      t.string :border_style
      t.string :underline
      t.string :margin
      t.string :text_align
      t.string :background_color
      t.string :font_style
      t.string :font_size
      t.string :font_color
      t.string :font_weight
      t.string :font_family
      t.string :input_type

      t.timestamps
    end
  end
end
