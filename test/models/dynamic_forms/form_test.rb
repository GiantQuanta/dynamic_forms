require 'test_helper'

module DynamicForms
  class FormTest < ActiveSupport::TestCase

    test "it requires a title" do
      form = Form.new
      assert form.invalid?
      assert form.errors[:title].any?
    end

    test "it has a list of items" do
      form = Form.new
      assert form.respond_to?(:items)
    end

  end
end
