require 'test_helper'

module DynamicForms
  class FormItemsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test 'should render a JSON manifest of the item type' do
      get item_fields_path(item_type: 'DynamicForms::TextQuestion', format: :json)
      body = JSON.parse(response.body)
      assert body['question']
      assert body['fields']
    end
  end
end

