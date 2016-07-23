require 'factory_girl'

module DynamicForms
  FactoryGirl.define do
    factory :text_question, class: TextQuestion do
      text_block
    end
  end
end
