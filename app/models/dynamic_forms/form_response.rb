module DynamicForms
  class FormResponse < ApplicationRecord
    belongs_to :form
    belongs_to :respondent, polymorphic: true, optional: true

    has_many :answers, inverse_of: :response, foreign_key: :response_id
    accepts_nested_attributes_for :answers, reject_if: proc {|params| params[:value_attributes].blank?}

    validates :form, presence: true
  end
end
