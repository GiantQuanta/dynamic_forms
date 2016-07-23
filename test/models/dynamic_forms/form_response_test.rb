require 'test_helper'

module DynamicForms
  class FormResponseTest < ActiveSupport::TestCase

    test "it requires a form" do
      form_response = FormResponse.new
      assert form_response.invalid?
      assert form_response.errors[:form].any?
    end

  end
end
