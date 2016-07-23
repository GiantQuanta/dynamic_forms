require 'test_helper'

module DynamicForms
  class TextAnswerTest < ActiveSupport::TestCase

    test "it as a value" do
      assert build(:text_answer).respond_to?(:value)
    end

  end
end
