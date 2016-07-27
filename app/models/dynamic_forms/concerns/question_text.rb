module DynamicForms::Concerns
  module QuestionText
    extend ActiveSupport::Concern

    included do
      belongs_to :text_block, autosave: true, dependent: :destroy
      accepts_nested_attributes_for :text_block

      delegate :text, :text=, to: :text_block
      delegate :title, :title=, to: :text_block
    end

    def text_block
      build_text_block if super.nil?
      super
    end

  end
end
