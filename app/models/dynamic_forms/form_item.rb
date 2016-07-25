module DynamicForms
  class FormItem < ApplicationRecord
    belongs_to :form
    belongs_to :item, polymorphic: true, validate: true, autosave: true

    before_create :set_position

    validates :attribute_name, presence: { if: :question? },
                               uniqueness: { if: :question?, scope: :form_id }

    accepts_nested_attributes_for :item
    attr_accessor :item_attributes

    def attributes=(attributes = {})
      self.item_type = attributes[:item_type]
      super
    end

    def item_attributes=(attributes)
      self.item = item_type.constantize.new(attributes)
    end

    protected

    def set_position
      return if position?
      self.position = form.items.maximum(:position).to_i + 1
    end

    def question?
      item.respond_to?(:question?) && item.question?
    end

  end
end
