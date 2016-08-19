require 'factory_girl'

module DynamicForms
  FactoryGirl.define do
    factory :multiple_choice_value, class: MultipleChoiceValue do
      association :option, factory: :multiple_choice_option
    end
  end
end
