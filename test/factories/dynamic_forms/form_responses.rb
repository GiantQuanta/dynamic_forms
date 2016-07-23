require 'factory_girl'

module DynamicForms
  FactoryGirl.define do
    factory :form_response, class: FormResponse do
      form
    end
  end
end
