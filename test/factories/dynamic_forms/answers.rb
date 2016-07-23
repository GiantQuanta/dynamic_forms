require 'factory_girl'

module DynamicForms
  FactoryGirl.define do
    factory :answer, class: Answer do
      association :response, factory: :form_response

      after(:create) do |answer|
        answer.item.form = answer.response.form
      end
    end
  end
end
