class CreateDynamicFormsAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :dynamic_forms_answers do |t|
      t.belongs_to :response, index: {name: "df_answer_resp"}
      t.belongs_to :item, index: {name: "df_answer_item"}
      t.belongs_to :value, polymorphic: true, index: {name: "df_answer_value"}

      t.timestamps
    end
  end
end
