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
      @form.items.build
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
        params.require(:form).permit(:title, :description)
      end
  end
end
