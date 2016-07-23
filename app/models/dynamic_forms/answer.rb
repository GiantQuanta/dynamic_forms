module DynamicForms
  class Answer < ApplicationRecord
    belongs_to :response, class_name: 'FormResponse'
    belongs_to :item, class_name: 'FormItem'
    belongs_to :value, polymorphic: true, dependent: :destroy

    validate :item_form_matches_response

    protected

    def item_form_matches_response
      return if item.blank? || response.blank?
      errors.add(:item, "form must match response") \
        unless item.form == response.form
    end
  end
end
