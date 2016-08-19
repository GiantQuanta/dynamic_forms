require "dynamic_forms/engine"

module DynamicForms

  ItemTypeDefinition = Struct.new(:name, :type, :description, :attributes, :value_type, :value_attributes) do
    def to_class
      self.type.constantize
    end
  end

  mattr_accessor :item_types do
    Hash.new
  end

  def self.register_item_type(name, type, description, attributes, value_type=nil, value_attributes=nil)
    self.item_types[type] = ItemTypeDefinition.new(name, type, description, attributes, value_type, value_attributes)
  end

  # Item types provided by DynamicForms. Yours can be registered
  # in an initializer by calling DynamicForms.register_item_type(...)
  register_item_type("Text Question",
                     "DynamicForms::TextQuestion",
                     "A question that collects a text response",
                     [:title, :text, :rows, :max_chars],
                     "DynamicForms::TextValue", [:value])
  register_item_type("Text Block",
                     "DynamicForms::TextBlock",
                     "A title and paragraph content for explainations and introductions",
                     [:title, :text, :appearance])
  register_item_type("Multiple Choice",
                     "DynamicForms::MultipleChoiceQuestion",
                     "A question answered from a list of available options",
                     [:title, :text, :appearance, :multiple, options_attributes: [:id, :label, :value]],
                     "DynamicForms::MultipleChoiceValue", [:option_id])

end

