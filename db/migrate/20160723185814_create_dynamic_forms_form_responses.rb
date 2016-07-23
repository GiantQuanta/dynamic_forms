class CreateDynamicFormsFormResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :dynamic_forms_form_responses do |t|
      t.belongs_to :form, index: {name: "df_form_resp_form"}
      t.belongs_to :respondent, polymorphic: true, index: {name: "df_form_resp_resp"}

      t.timestamps
    end
  end
end
