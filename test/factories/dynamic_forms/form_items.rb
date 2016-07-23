require 'factory_girl'

module DynamicForms
  FactoryGirl.define do
    factory :form_item, class: FormItem do
      form
    end
  end
end
