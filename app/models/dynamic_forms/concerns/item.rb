module DynamicForms
  module Concerns::Item
    extend ActiveSupport::Concern

    included do
      has_one :form_item, class_name: 'FormItem', inverse_of: :item
    end

    def question?
      false
    end

    def prepare_fields
    end

  end
end
