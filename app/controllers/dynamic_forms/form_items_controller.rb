require_dependency "dynamic_forms/application_controller"

module DynamicForms
  class FormItemsController < ApplicationController

    def fields
      render partial: fields_partial_path
    end

    protected

    def fields_partial_path
      parts = item_type.new.to_partial_path.split('/')
      parts[-1] = 'fields'
      parts.join('/')
    end

    def item_type
      params[:item_type].constantize
    end

  end
end
