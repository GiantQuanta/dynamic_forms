class CreateDynamicFormsMultipleChoiceValues < ActiveRecord::Migration[5.0]
  def change
    create_table :dynamic_forms_multiple_choice_values do |t|
      t.belongs_to :option, index: {name: "df_multi_choice_val_option"}

      t.timestamps
    end
  end
end
