module DynamicForms
  class Form < ApplicationRecord
    has_many :items, ->{ order(:position) }, class_name: 'FormItem'

    validates :title, presence: true

    accepts_nested_attributes_for :items, reject_if: proc {|params| params[:item_type].blank? }
  end
end
