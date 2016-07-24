require_dependency "dynamic_forms/application_controller"

module DynamicForms
  class FormItemsController < ApplicationController

    def fields
      question = item.respond_to?(:question?) && item.question?
      render json: { question: question, fields: render_to_string(partial: fields_partial_path, formats: [:html]) }
    end

    protected

    def item
      @item ||= item_type.new
    end

    def fields_partial_path
      parts = item.to_partial_path.split('/')
      parts[-1] = 'fields'
      parts.join('/')
    end

    def item_type
      params[:item_type].constantize
    end

  end
end
