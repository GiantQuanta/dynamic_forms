module DynamicForms
  class TextBlock < ApplicationRecord
    include Concerns::Item

    validates :text, presence: true
  end
end
