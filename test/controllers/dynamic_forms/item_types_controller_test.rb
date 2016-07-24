require 'test_helper'

module DynamicForms
  class FormItemsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test 'should render the correct partial' do
      get item_fields_path(item_type: 'DynamicForms::TextQuestion')
      assert_select 'input[name=title]'
    end
  end
end

