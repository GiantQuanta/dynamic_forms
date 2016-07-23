require 'test_helper'

module DynamicForms
  class FormItemTest < ActiveSupport::TestCase

    test "it responds to #form" do
      assert FormItem.new.respond_to?(:form)
    end

    test "it responds to #item" do
      assert FormItem.new.respond_to?(:item)
    end

    test "it responds to #position" do
      assert FormItem.new.respond_to?(:position)
    end

  end
end
