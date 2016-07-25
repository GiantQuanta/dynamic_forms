module DynamicForms
  class FormItem < ApplicationRecord
    belongs_to :form
    belongs_to :item, polymorphic: true, validate: true, autosave: true

    before_create :set_position

    validates :attribute_name, presence: { if: :question? },
                               uniqueness: { if: :question?, scope: :form_id }

    accepts_nested_attributes_for :item

    def item_attributes=(attributes)
      if self.item.blank?
        self.item = item_type.constantize.new(attributes)
      end
      super
    end

    def question?
      item.present? && item.respond_to?(:question?) && item.question?
    end

    protected

    def set_position
      return if position?
      self.position = form.items.maximum(:position).to_i + 1
    end

  end
end
