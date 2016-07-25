require_dependency "dynamic_forms/application_controller"

module DynamicForms
  class ItemTypesController < ApplicationController
    helper_method :form_partial_path

    def fields
      @item = item
      question = @item.respond_to?(:question?) && @item.question?
      html = render_to_string(action: :fields, formats: [:html], layout: false)
      render json: { question: question, fields: html }
    end

    protected

    def item
      item_type.new
    end

    def form_partial_path
      parts = @item.to_partial_path.split('/')
      parts[-1] = 'form'
      parts.join('/')
    end

    def item_type
      params[:item_type].constantize
    end

  end
end
