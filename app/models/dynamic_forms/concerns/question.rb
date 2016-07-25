module DynamicForms::Concerns
  module Question
    extend ActiveSupport::Concern

    included do
      include QuestionText

      has_one :form_item, as: :item
      accepts_nested_attributes_for :form_item
    end

    def question?
      true
    end

  end
end
