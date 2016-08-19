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

    test "it accepts option attributes as long as a label is given" do
      mcq = build(:multiple_choice_question)
      mcq.attributes = {
        options_attributes: {
          "0" => { label: "Red", value: 1 },
          "1" => { label: "Blue" },
          "3" => { value: 3 }
        }
      }
      assert mcq.save
      assert_equal 2, mcq.options.count
      assert_equal ["Red", "Blue"], mcq.options.map(&:label)
    end

  end
end
