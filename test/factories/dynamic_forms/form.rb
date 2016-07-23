require 'factory_girl'

module DynamicForms
  FactoryGirl.define do
    factory :form, class: Form do
      sequence(:title) {|n| "Form #{n}"}
    end
  end
end
