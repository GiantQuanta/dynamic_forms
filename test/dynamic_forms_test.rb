require 'test_helper'

class DynamicForms::Test < ActiveSupport::TestCase

  test "it should have a list of item types" do
    assert DynamicForms.respond_to?(:item_types)
    assert_kind_of Hash, DynamicForms.item_types
  end

  test ".register_item_type" do
    class TestType; end
    DynamicForms.register_item_type("Test Type", "DynamicForms::Test::TestType", "A test type", [])

    item_def = DynamicForms.item_types["DynamicForms::Test::TestType"]
    assert_equal TestType, item_def.to_class
    assert_equal 'DynamicForms::Test::TestType', item_def.type

    item_def_count = DynamicForms.item_types.size
    DynamicForms.register_item_type("Another Name", "DynamicForms::Test::TestType", "Would be as sweet", [])
    assert_equal item_def_count, DynamicForms.item_types.size
  end

end
