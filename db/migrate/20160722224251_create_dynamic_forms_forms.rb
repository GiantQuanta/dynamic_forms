class CreateDynamicFormsForms < ActiveRecord::Migration[5.0]
  def change
    create_table :dynamic_forms_forms do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
