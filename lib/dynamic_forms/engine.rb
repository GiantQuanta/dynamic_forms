module DynamicForms
  class Engine < ::Rails::Engine
    require 'jquery-rails'

    isolate_namespace DynamicForms
  end
end
