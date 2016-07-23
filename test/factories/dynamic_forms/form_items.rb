require 'factory_girl'

module DynamicForms
  FactoryGirl.define do
    factory :form_item, class: FormItem do
      form
      item { create :text_block }
    end
  end
end
