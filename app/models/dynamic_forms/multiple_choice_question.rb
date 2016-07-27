module DynamicForms
  class MultipleChoiceQuestion < ApplicationRecord
    include Concerns::Question

    APPEARANCES = [
      'select', # A single or multiple select field
      'tick'    # A group of checkboxes or radio options
    ]

    has_many :options, ->{ order(:position) }, class_name: 'MultipleChoiceOption',
                       inverse_of: :question, foreign_key: :question_id, dependent: :destroy
    accepts_nested_attributes_for :options, reject_if: proc { |attrs| attrs['label'].blank? }

    validate :acceptable_appearance

    def prepare_fields
      options.build
    end

    protected

    def acceptable_appearance
      errors.add(:appearance, "must be one of #{APPEARANCES.join(', ')}") \
        unless APPEARANCES.include?(appearance)
    end

  end
end
