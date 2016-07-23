class CreateDynamicFormsTextAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :dynamic_forms_text_answers do |t|
      t.text :value

      t.timestamps
    end
  end
end
