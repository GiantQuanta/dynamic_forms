require 'test_helper'

module DynamicForms
  class TextBlockTest < ActiveSupport::TestCase

    test "it should have text" do
      text_block = TextBlock.new
      assert text_block.invalid?
      assert text_block.errors[:text].any?
    end

  end
end
