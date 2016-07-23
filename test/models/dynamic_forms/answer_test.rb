require 'test_helper'

module DynamicForms
  class AnswerTest < ActiveSupport::TestCase

    test "it must reference a response" do
      assert build(:answer, response: nil).invalid?
    end

    test "it must reference an item" do
      assert build(:answer, item: nil).invalid?
    end

    test "it references a value" do
      assert Answer.new.respond_to?(:value)
    end

    test "its item must be of the same form as its response" do
      answer = build(:answer)
      answer.item = build(:form_item)
      assert answer.invalid?
      assert answer.errors[:item].any?
    end

    test "when the answer is destroyed so is the value" do
      answer = build(:answer)
      answer.save
      value = answer.value
      assert value.persisted?
      answer.destroy
      assert !value.persisted?
    end

  end
end
