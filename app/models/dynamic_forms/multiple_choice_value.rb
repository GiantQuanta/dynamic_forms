module DynamicForms
  class MultipleChoiceValue < ApplicationRecord
    belongs_to :option, class_name: 'MultipleChoiceOption'
  end
end
