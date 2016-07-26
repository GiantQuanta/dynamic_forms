module DynamicForms
  class Engine < ::Rails::Engine
    require 'jquery-rails'
    require 'js-routes'
    require 'foundation-rails'

    isolate_namespace DynamicForms
  end
end
