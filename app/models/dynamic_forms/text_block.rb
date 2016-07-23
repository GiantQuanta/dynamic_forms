module DynamicForms
  class TextBlock < ApplicationRecord
    validates :text, presence: true
  end
end
