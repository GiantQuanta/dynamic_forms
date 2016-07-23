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

    test "it increments position as added" do
      form = create :form

      item1 = create :form_item, form: form
      item2 = create :form_item, form: form

      assert_equal 1, item1.reload.position
      assert_equal 2, item2.reload.position
    end

    test "it requires #attribute_name if item is a question" do
      # A text block item needs no attribute_name
      form_item = build :form_item, attribute_name: nil
      assert form_item.valid?

      # Question items must have an attribute name
      form_item = build :form_item, :question, attribute_name: nil
      assert form_item.invalid?
    end

    test "it requires #attribute_name to be unique" do
      item = create :form_item, :question
      form_item = build :form_item, :question, form: item.form, attribute_name: item.attribute_name
      assert form_item.invalid?
    end

  end
end
