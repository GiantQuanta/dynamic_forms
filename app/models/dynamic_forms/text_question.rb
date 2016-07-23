module DynamicForms
  class TextQuestion < ApplicationRecord
    belongs_to :text_block

    delegate :text, to: :text_block
    delegate :text=, to: :text_block

    delegate :title, to: :text_block
    delegate :title=, to: :text_block
  end
end
