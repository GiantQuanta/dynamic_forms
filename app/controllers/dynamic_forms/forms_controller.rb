require_dependency "dynamic_forms/application_controller"

module DynamicForms
  class FormsController < ApplicationController
    before_action :set_form, only: [:show, :edit, :update, :destroy]

    # GET /forms
    def index
      @forms = Form.all
    end

    # GET /forms/1
    def show
    end

    # GET /forms/new
    def new
      @form = Form.new
    end

    # GET /forms/1/edit
    def edit
      @form.items.build
    end

    # POST /forms
    def create
      @form = Form.new(form_params)

      if @form.save
        redirect_to @form, notice: 'Form was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /forms/1
    def update
      if @form.update(form_params)
        redirect_to @form, notice: 'Form was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /forms/1
    def destroy
      @form.destroy
      redirect_to forms_url, notice: 'Form was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_form
        @form = Form.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def form_params
        accepted_item_params = [:id]
        if items_attributes = params[:form].try(:[], :items_attributes)
          items_attributes.each do |index, attrs|
            if attrs[:item_type] && DynamicForms.item_types.has_key?(attrs[:item_type])
              DynamicForms.item_types[attrs[:item_type]].attributes.each {|attr| accepted_item_params << attr }
            end
          end
        end
        params.require(:form).permit(:title, :description,
                                     items_attributes: [:id, :attribute_name, :required, :item_type,
                                                        item_attributes: accepted_item_params.uniq])
      end
  end
end
