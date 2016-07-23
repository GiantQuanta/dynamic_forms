class CreateDynamicFormsTextBlocks < ActiveRecord::Migration[5.0]
  def change
    create_table :dynamic_forms_text_blocks do |t|
      t.string :title
      t.string :appearance
      t.text :text

      t.timestamps
    end
  end
end
