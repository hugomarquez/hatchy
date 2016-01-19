# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../dummy/config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!
require 'factory_girl_rails'
require 'capybara/rspec'
require 'devise'
require 'pundit/rspec'

ENGINE_RAILS_ROOT=File.join(File.dirname(__FILE__), '../')
Dir[File.join(ENGINE_RAILS_ROOT, "spec/factories/**/*.rb")].each {|f| require f }
Dir[File.join(ENGINE_RAILS_ROOT, "spec/support/**/*.rb")].each {|f| require f }
Dir[File.join(ENGINE_RAILS_ROOT, "spec/concerns/**/*.rb")].each {|f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include Hatchy::Engine.routes.url_helpers
  config.include FactoryGirl::Syntax::Methods
  config.include Devise::TestHelpers, :type => :controller
  config.extend Hatchy::ControllerMacros, :type => :controller
  config.render_views
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
end
