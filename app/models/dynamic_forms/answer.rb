module DynamicForms
  class Answer < ApplicationRecord
    belongs_to :response, class_name: 'FormResponse', foreign_key: :response_id
    belongs_to :item, class_name: 'FormItem'
    belongs_to :value, polymorphic: true

    accepts_nested_attributes_for :value

    validate :item_form_matches_response

    def build_value(attrs={})
      self.value = item.answer_value_type.new(attrs)
    end

    protected

    def item_form_matches_response
      return if item.blank? || response.blank?
      errors.add(:item, "form must match response") \
        unless item.form == response.form
    end
  end
end
