class CreateDynamicFormsTextQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :dynamic_forms_text_questions do |t|
      t.belongs_to :text_block, index: {name: "df_txt_q_txt_blk"}
      t.integer :rows
      t.integer :max_chars

      t.timestamps
    end
  end
end
