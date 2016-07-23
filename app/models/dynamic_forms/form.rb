module DynamicForms
  class Form < ApplicationRecord
    has_many :items, class_name: 'FormItem'

    validates :title, presence: true
  end
end
