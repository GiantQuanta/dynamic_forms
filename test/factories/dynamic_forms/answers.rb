require 'factory_girl'

module DynamicForms
  FactoryGirl.define do
    factory :answer, class: Answer do
      association :response, factory: :form_response, strategy: :build
      association :item, factory: :form_item, strategy: :build
      association :value, factory: :text_value

      before(:create) do |a, e|
        a.item.form = a.response.form
      end
    end
  end
end
