require_dependency "dynamic_forms/application_controller"

module DynamicForms
  class FormResponsesController < ApplicationController
    before_action :set_form

    def new
      @form_response = FormResponse.new(form: @form)
      render layout: 'dynamic_forms/response'
    end

    def create
      @form_response = @form.responses.new(form_response_params)
      if @form_response.save
        flash[:notice] = "Your response has been submitted"
        redirect_to root_path
      else
        render action: :new
      end
    end


    protected

    def set_form
      @form = Form.find(params[:form_id])
    end

    def form_response_params
      accepted_value_attributes = [:id]
      @form.items.map do |form_item|
        if form_item.question?
          DynamicForms.item_types[form_item.item.class.name].value_attributes.each do |attr|
            accepted_value_attributes << attr
          end
        end
      end
      params.require(:form_response).permit(answers_attributes: [:value_type, :item_id,
                                                                 value_attributes: accepted_value_attributes.uniq])
    end
  end
end
