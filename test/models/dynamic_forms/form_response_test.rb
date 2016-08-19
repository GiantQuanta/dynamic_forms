require 'test_helper'

module DynamicForms
  class FormResponseTest < ActiveSupport::TestCase

    test "it requires a form" do
      form_response = FormResponse.new
      assert form_response.invalid?
      assert form_response.errors[:form].any?
    end

    test "it has many answers" do
      assert FormResponse.new.respond_to?(:answers)
    end

    test "it accepts attributes for answers if values are given" do
      text_question_item = build(:form_item, :question)
      mc_question_item = build(:form_item, attribute_name: 'fav_color', item: build(:multiple_choice_question, :favorite_color))
      red_option = mc_question_item.item.options.first
      form = create(:form, items: [text_question_item, mc_question_item])
      form_response = build(:form_response, form: form)
      form_response.attributes = {
        answers_attributes: {
          "0" => { item_id: text_question_item.id, value_attributes: { value: "Text Response" } },
          "1" => { item_id: mc_question_item.id,   value_attributes: { option_id: red_option.id } },
          "2" => { item_id: mc_question_item.id },
          "3" => { item_id: mc_question_item.id }
        }
      }
      assert form_response.valid?
      form_response.save
      assert_equal 2, form_response.answers.count
      assert_equal red_option.id, form_response.answers.last.value.option_id
    end

  end
end
