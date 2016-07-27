class CreateDynamicFormsMultipleChoiceQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :dynamic_forms_multiple_choice_questions do |t|
      t.belongs_to :text_block, index: {name: "df_multi_choice_text"}
      t.boolean :multiple
      t.string :appearance

      t.timestamps
    end
  end
end
