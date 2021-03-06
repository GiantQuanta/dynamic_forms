require 'factory_girl'

module DynamicForms
  FactoryGirl.define do
    factory :multiple_choice_option, class: MultipleChoiceOption do
      association :question, factory: :multiple_choice_question
      sequence(:label) {|n| "Option ##{n}" }
      sequence(:value) {|n| n }
    end
  end
end
