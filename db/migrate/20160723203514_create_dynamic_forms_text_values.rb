class CreateDynamicFormsTextValues < ActiveRecord::Migration[5.0]
  def change
    create_table :dynamic_forms_text_values do |t|
      t.text :value

      t.timestamps
    end
  end
end
