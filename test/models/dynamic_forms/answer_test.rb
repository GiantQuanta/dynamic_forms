require 'test_helper'

module DynamicForms
  class AnswerTest < ActiveSupport::TestCase

    test "it must reference a response" do
      assert build(:answer, response: nil).invalid?
    end

    test "it must reference an item" do
      assert build(:answer, item: nil).invalid?
    end

    test "its item must be of the same form as its response" do
      answer = build(:answer)
      answer.item = build(:form_item)
      assert answer.invalid?
      assert answer.errors[:item].any?
    end

    test "it builds the appropriate value type" do
      answer = build(:answer, value: nil, item: build(:form_item, :question))
      assert_nil answer.value
      answer.attributes = { value_attributes: { value: "Some Text" } }
      assert_equal DynamicForms::TextValue, answer.value.class
    end

  end
end
