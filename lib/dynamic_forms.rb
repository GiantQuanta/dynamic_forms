require "dynamic_forms/engine"

module DynamicForms

  ItemTypeDefinition = Struct.new(:name, :type, :description) do
    def to_class
      self.type.constantize
    end
  end

  mattr_accessor :item_types do
    [ ]
  end

  def self.register_item_type(name, type, description)
    # Don't allow multiple registrations of same type (autoreload)
    return if self.item_types.map(&:type).include?(type)
    self.item_types << ItemTypeDefinition.new(name, type, description)
  end

  # Item types provided by DynamicForms. Yours can be registered
  # in an initializer by calling DynamicForms.register_item_type(...)
  register_item_type("Text Question", "DynamicForms::TextQuestion", "A question that collects a text response")
  register_item_type("Text Block", "DynamicForms::TextBlock", "A title and paragraph content for explainations and introductions")

end

