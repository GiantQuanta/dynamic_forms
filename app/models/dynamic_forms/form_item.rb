module DynamicForms
  class FormItem < ApplicationRecord
    belongs_to :form
    belongs_to :item, polymorphic: true, validate: true, autosave: true, dependent: :destroy
    has_many :answers, foreign_key: :item_id

    before_create :set_position

    validates :attribute_name, presence: { if: :question? },
                               uniqueness: { if: :question?, scope: :form_id }

    accepts_nested_attributes_for :item

    delegate :answer_value_type, to: :item

    def position
      set_position if super.blank?
      super
    end

    def item_attributes=(attributes)
      self.item = item_type.constantize.new if self.item.blank?
      super
    end

    def question?
      item.present? && item.respond_to?(:question?) && item.question?
    end

    def title_with_context
      "Item ##{position}: #{self.try(:item).try(:title) || "Untitled"}"
    end

    def build_answer
      answers.build.tap {|answer| answer.build_value }
    end

    protected

    def set_position
      return if position?
      self.position = form.items.maximum(:position).to_i + 1
    end

  end
end
