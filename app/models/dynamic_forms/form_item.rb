module DynamicForms
  class FormItem < ApplicationRecord
    belongs_to :form
    belongs_to :item, polymorphic: true
  end
end
