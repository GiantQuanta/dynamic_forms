module DynamicForms::Concerns
  module Question
    extend ActiveSupport::Concern

    included do
      include QuestionText
    end

    def question?
      true
    end

  end
end
