module DynamicForms
  class FormResponse < ApplicationRecord
    belongs_to :form
    belongs_to :respondent, polymorphic: true

    validates :form, presence: true
  end
end
