module DynamicForms::Concerns
  module Question
    extend ActiveSupport::Concern

    included do
      include Item
      include QuestionText

      has_one :form_item, as: :item
      accepts_nested_attributes_for :form_item

      delegate :build_answer, to: :form_item

      def question?
        true
      end

      def answer_value_type
        DynamicForms.item_types[self.class.name].value_type.constantize
      end
    end

  end
end
