module DynamicForms
  class Engine < ::Rails::Engine
    require 'jquery-rails'
    require 'js-routes'

    isolate_namespace DynamicForms
  end
end
