require 'factory_girl'

module DynamicForms
  FactoryGirl.define do
    factory :multiple_choice_question, class: MultipleChoiceQuestion do
      text_block
      multiple false
      appearance "select"

      trait :favorite_color do
        options { ['Red', 'Green', 'Blue'].map {|c| build(:multiple_choice_option, label: c)} }
      end
    end
  end
end
