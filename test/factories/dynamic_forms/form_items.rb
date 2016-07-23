require 'factory_girl'

module DynamicForms
  FactoryGirl.define do
    factory :form_item, class: FormItem do
      form
      association :item, factory: :text_block

      trait :question do
        sequence(:attribute_name) {|n| "attribute_#{n}" }
        association :item, factory: :text_question
      end
    end
  end
end
