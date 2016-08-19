# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../../test/dummy/config/environment.rb", __FILE__)
ActiveRecord::Migrator.migrations_paths = [File.expand_path("../../test/dummy/db/migrate", __FILE__)]
ActiveRecord::Migrator.migrations_paths << File.expand_path('../../db/migrate', __FILE__)

require "factory_girl_rails"
require "minitest/reporters"
require 'capybara/rails'
require 'capybara/webkit'
require "rails/test_help"

# Filter out Minitest backtrace while allowing backtrace from other libraries
# to be shown.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new
Minitest::Reporters.use!

# Load fixtures from the engine
if ActiveSupport::TestCase.respond_to?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("../fixtures", __FILE__)
  ActionDispatch::IntegrationTest.fixture_path = ActiveSupport::TestCase.fixture_path
  ActiveSupport::TestCase.file_fixture_path = ActiveSupport::TestCase.fixture_path + "/files"
  ActiveSupport::TestCase.fixtures :all
end

# Use Capybara::Webkit as the default javascript driver
Capybara.javascript_driver = :webkit


class ActiveSupport::TestCase
  # Include FactoryGirl DSL in all tests
  include FactoryGirl::Syntax::Methods
end


class ActionDispatch::IntegrationTest
  # Include the Capybara DSL in all integration tests
  include Capybara::DSL

  # Reset sessions and driver between tests
  # Use super when overriding this method in tests
  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end
