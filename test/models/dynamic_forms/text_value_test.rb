require 'test_helper'

module DynamicForms
  class TextValueTest < ActiveSupport::TestCase

    test "it has a value" do
      assert build(:text_value).value
    end

  end
end
