require_dependency "dynamic_forms/application_controller"

module DynamicForms
  class ItemTypesController < ApplicationController

    def fields
      @item = item
      question = @item.respond_to?(:question?) && @item.question?
      @item.prepare_fields
      html = render_to_string(action: :fields, formats: [:html], layout: false)
      render json: { question: question, fields: html }
    end

    protected

    def item
      item_type.new
    end

    def item_type
      params[:item_type].constantize
    end

  end
end
