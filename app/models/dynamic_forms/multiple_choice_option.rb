module DynamicForms
  class MultipleChoiceOption < ApplicationRecord
    belongs_to :question, class_name: 'MultipleChoiceQuestion', inverse_of: :options, autosave: true

    validates :label, presence: true

    def value
      super.blank? ? label : super
    end
  end
end
