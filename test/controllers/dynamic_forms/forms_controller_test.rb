require 'test_helper'

module DynamicForms
  class FormsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @form = create :form
    end

    test "should get index" do
      get forms_url
      assert_response :success
    end

    test "should get new" do
      get new_form_url
      assert_response :success
    end

    test "should create form" do
      assert_difference('Form.count') do
        post forms_url, params: { form: { description: @form.description, title: @form.title } }
      end

      assert_redirected_to form_url(Form.last)
    end

    test "should show form" do
      get form_url(@form)
      assert_response :success
    end

    test "should get edit" do
      get edit_form_url(@form)
      assert_response :success
    end

    test "should update form" do
      patch form_url(@form), params: { form: { description: @form.description, title: @form.title } }
      assert_redirected_to form_url(@form)
    end

    test "should permit nested attribtues selected item types" do
      form_params = { description: @form.description, title: @form.title }
      form_params[:items_attributes] = { '0' => { item_type: 'DynamicForms::TextQuestion',
                                                  attribute_name: 'test_attribute',
                                                  item_attributes: { text: 'text', title: 'title' } } }
      patch form_url(@form), params: { form: form_params }
      assert_equal "title", @form.items.first.item.title
      assert_redirected_to form_url(@form)
    end

    test "should permit multiple choice options" do
      form_params = { description: @form.description, title: @form.title }
      form_params[:items_attributes] = { '0' => { item_type: 'DynamicForms::MultipleChoiceQuestion',
                                                  attribute_name: 'test_attribute',
                                                  item_attributes: {
                                                    title: 'title',
                                                    text: 'text',
                                                    appearance: 'select',
                                                    options_attributes: {
                                                      '0' => { label: 'one', value: 1 },
                                                      '1' => { label: 'two', value: 2 }}}}}
      patch form_url(@form), params: { form: form_params }
      assert_equal "title", @form.items.first.item.title
      assert_redirected_to form_url(@form)
    end

    test "should destroy form" do
      assert_difference('Form.count', -1) do
        delete form_url(@form)
      end

      assert_redirected_to forms_url
    end
  end
end
