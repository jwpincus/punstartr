ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rails'
require 'capybara/rspec'
require 'support/factory_girl'
require 'database_cleaner'
require 'faker'
require 'support/mailer_macros'


include ActionView::Helpers::NumberHelper

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include(AuthenticationHelper)
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include(MailerMacros)
  config.before(:each) { reset_email }
end

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.javascript_driver = :selenium_chrome

# RSpec.configure do |config|
#   # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
#   config.fixture_path = "#{::Rails.root}/spec/fixtures"
#   config.use_transactional_fixtures = false
#   config.infer_spec_type_from_file_location!
#   config.filter_rails_from_backtrace!
#   config.before(:suite) do
#     DatabaseCleaner.clean_with(:truncation)
#   end
#   config.before(:each) do
#     DatabaseCleaner.strategy = :truncation
#   end
#   config.before(:each, js: true) do
#     DatabaseCleaner.strategy = :truncation
#   end
#   # This block must be here, do not combine with the other `before(:each)` block.
#   # This makes it so Capybara can see the database.
#   config.before(:each) do
#     DatabaseCleaner.start
#   end
#   config.after(:each) do
#     DatabaseCleaner.clean
#   end
# end

# below was original code

#
# DatabaseCleaner.strategy = :truncation
# RSpec.configure do |c|
#   c.before(:all) do
#     DatabaseCleaner.clean
#   end
#   c.after(:each) do
#     DatabaseCleaner.clean
#   end
# end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
