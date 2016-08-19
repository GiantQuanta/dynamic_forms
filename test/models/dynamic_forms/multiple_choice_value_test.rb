require 'test_helper'

module DynamicForms
  class MultipleChoiceValueTest < ActiveSupport::TestCase

    test "it must associate an option" do
      assert build(:multiple_choice_value, option: nil).invalid?
    end

  end
end
