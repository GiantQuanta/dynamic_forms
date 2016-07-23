require 'test_helper'

module DynamicForms
  class TextQuestionTest < ActiveSupport::TestCase

    test "it should have #rows to specify its height" do
      assert TextQuestion.new.respond_to?(:rows)
      assert TextQuestion.new.respond_to?(:rows=)
    end

    test "it should have a #title" do
      assert TextQuestion.new.respond_to?(:title)
    end

    test "it should have a #text for a longer description" do
      assert TextQuestion.new.respond_to?(:text)
    end

    test "it should have a #max_chars to limit the response length" do
      assert TextQuestion.new.respond_to?(:max_chars)
    end

    test "it should always build the underlying text_block that stores the question" do
      text_question = TextQuestion.new
      text_question.text = "Text"
      text_question.title = "Title"
      assert text_question.save
      assert text_question.text_block.persisted?
    end

  end
end
