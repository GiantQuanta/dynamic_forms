require 'factory_girl'

module DynamicForms
  FactoryGirl.define do
    factory :answer, class: Answer do
      association :response, factory: :form_response
      association :value, factory: :text_answer

      after(:create) do |answer|
        answer.item.form = answer.response.form
      end
    end

    factory :text_answer, class: TextAnswer do
      value "The answer to the question"
    end
  end
end
