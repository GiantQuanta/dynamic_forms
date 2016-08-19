module DynamicForms
  module IntegrationHelper
    extend ActiveSupport::Concern

    private

    def add_text_question(key="text_question_1")
      within(all("fieldset.item").last) do
        select("Text Question", from: "Type")
        fill_in("Key", with: key)
        fill_in("Title", with: "Text Question: #{key}")
        fill_in("Text", with: "Question Text: #{key}")
      end
    end

    def add_multiple_choice_question(key="mult_choice_1", options=[['One', 1], ['Two', 2]])
      within(all("fieldset.item").last) do
        select("Multiple Choice", from: "Type")
        fill_in("Key", with: key)
        fill_in("Title", with: "Select a number")
        fill_in("Text", with: "I'm thinking of a number between 1 and 2")
        select("select", from: "Appearance")
        this_option = all('.multiple-choice-option-fields').last
        options.each_with_index do |val, index|
          label, value = val
          within(this_option) do
            fill_in("Label", with: label)
            fill_in("Value", with: value)
          end
          this_option = all('.multiple-choice-option-fields').last
        end
      end
    end

    def create_and_edit
      # Create a new form
      visit new_form_path
      fill_in "Title", with: "Test Form"
      fill_in "Description", with: "Form Description"
      click_on "Create Form"

      # Edit the form
      click_on "Edit"
    end
  end
end
