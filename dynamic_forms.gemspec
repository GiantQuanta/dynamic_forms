$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "dynamic_forms/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "dynamic_forms"
  s.version     = DynamicForms::VERSION
  s.authors     = ["Sam Coles"]
  s.email       = ["sam.coles@giantquanta.com"]
  s.homepage    = "https://github.com/GiantQuanta/dynamic-forms"
  s.summary     = "Dynamic schema and form builder for Rails"
  s.description = "Mountable Rails Engine to build, launch, and analyze dynamic forms"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.0"
  s.add_dependency "jquery-rails"
  s.add_dependency "sass-rails", "~> 5.0.0"
  s.add_dependency "js-routes"
  s.add_dependency "foundation-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "byebug"
end
