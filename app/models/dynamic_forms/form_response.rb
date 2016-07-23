module DynamicForms
  class FormResponse < ApplicationRecord
    belongs_to :form
    belongs_to :respondent, polymorphic: true, optional: true

    has_many :answers

    validates :form, presence: true
  end
end
