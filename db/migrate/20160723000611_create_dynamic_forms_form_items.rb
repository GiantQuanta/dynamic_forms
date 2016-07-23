class CreateDynamicFormsFormItems < ActiveRecord::Migration[5.0]
  def change
    create_table :dynamic_forms_form_items do |t|
      t.belongs_to :form, index: {name: "df_form_items_form"}
      t.belongs_to :item, polymorphic: true, index: {name: "df_form_items_item"}
      t.integer :position, index: {name: "df_form_items_position"}
      t.boolean :required

      t.timestamps
    end
  end
end
