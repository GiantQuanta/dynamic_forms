class CreateDynamicFormsMultipleChoiceOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :dynamic_forms_multiple_choice_options do |t|
      t.belongs_to :question, index: {name: "df_multi_option_q"}
      t.integer :position, index: {name: "df_multi_option_pos"}
      t.string :label
      t.integer :value

      t.timestamps
    end
  end
end
