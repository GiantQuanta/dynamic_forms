module DynamicForms
  class FormItem < ApplicationRecord
    belongs_to :form
    belongs_to :item, polymorphic: true

    before_create :set_position

    protected

    def set_position
      return if position?
      self.position = form.items.maximum(:position).to_i + 1
    end
  end
end
