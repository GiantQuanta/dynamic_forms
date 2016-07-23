module DynamicForms
  class Engine < ::Rails::Engine
    isolate_namespace DynamicForms

    config.generators do |g|
      g.fixture_replacement :factory_girl, dir: 'test/factories'
    end
  end
end
