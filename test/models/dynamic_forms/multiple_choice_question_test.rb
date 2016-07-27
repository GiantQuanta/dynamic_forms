require 'test_helper'

module DynamicForms
  class MultipleChoiceQuestionTest < ActiveSupport::TestCase

    test "it only allows appearances specified in APPEARANCES" do
      assert build(:multiple_choice_question, appearance: "text_field").invalid?
    end

  end
end
