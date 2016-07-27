require 'test_helper'

module DynamicForms
  class MultipleChoiceOptionTest < ActiveSupport::TestCase

    test "it requires a label" do
      assert build(:multiple_choice_option, label: nil).invalid?
    end

    test "its value is its label if no value present" do
      assert_equal 'test', build(:multiple_choice_option, value: nil, label: 'test').value
    end

  end
end
