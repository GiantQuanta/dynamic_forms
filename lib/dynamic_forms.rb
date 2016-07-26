require "dynamic_forms/engine"

module DynamicForms

  ItemTypeDefinition = Struct.new(:name, :type, :description, :attributes) do
    def to_class
      self.type.constantize
    end
  end

  mattr_accessor :item_types do
    Hash.new
  end

  def self.register_item_type(name, type, description, attributes)
    self.item_types[type] = ItemTypeDefinition.new(name, type, description, attributes)
  end

  # Item types provided by DynamicForms. Yours can be registered
  # in an initializer by calling DynamicForms.register_item_type(...)
  register_item_type("Text Question",
                     "DynamicForms::TextQuestion",
                     "A question that collects a text response",
                     [:title, :text, :rows, :max_chars])
  register_item_type("Text Block",
                     "DynamicForms::TextBlock",
                     "A title and paragraph content for explainations and introductions",
                     [:title, :text, :appearance])

end

