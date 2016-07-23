require 'factory_girl'

module DynamicForms
  FactoryGirl.define do
    factory :text_block, class: TextBlock do
      sequence(:title) {|n| "Text Block 1"}
      text "text content"
    end
  end
end
