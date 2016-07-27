require 'test_helper'

module DynamicForms
  class MultipleChoiceQuestionTest < ActiveSupport::TestCase

    test "it only allows appearances specified in APPEARANCES" do
      assert build(:multiple_choice_question, appearance: "text_field").invalid?
    end

    test "it retains the order of options" do
      q = create(:multiple_choice_question)
      create(:multiple_choice_option, question: q, position: 2)
      create(:multiple_choice_option, question: q, position: 3)
      create(:multiple_choice_option, question: q, position: 1)
      assert_equal [1,2,3], q.options.map(&:position)
    end

    test "it is a question" do
      assert build(:multiple_choice_question).question?
    end

  end
end
