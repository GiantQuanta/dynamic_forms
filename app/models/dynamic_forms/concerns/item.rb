module DynamicForms
  module Concerns::Item
    extend ActiveSupport::Concern

    def question?
      false
    end

    def prepare_fields
    end

  end
end
