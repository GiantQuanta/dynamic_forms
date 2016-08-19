require 'factory_girl'

module DynamicForms
  FactoryGirl.define do
    factory :text_value, class: TextValue do
      value "The answer to the question"
    end
  end
end
