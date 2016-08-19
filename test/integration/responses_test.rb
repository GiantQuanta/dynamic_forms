require 'test_helper'
require 'integration_helper'

module DynamicForms
  class ResponsesTest < ActionDispatch::IntegrationTest
    include DynamicForms::Engine.routes.url_helpers
    include IntegrationHelper

    setup do
      @routes = DynamicForms::Engine.routes
      Capybara.current_driver = Capybara.javascript_driver
    end

    test "can respond to a form" do
      # Create a form with a text field and multiple choice
      create_and_edit
      add_text_question
      add_multiple_choice_question
      click_on "Update Form"
      assert page.has_content?("Form was successfully updated")

      # Create a form response to the newly created form
      click_on "Respond"

      within(all(".question").first) do
        find("textarea").set("Test")
      end

      within(all(".question").last) do
        all("input[type=radio]").first.click
      end

      click_on "Create Form response"
    end
  end
end

