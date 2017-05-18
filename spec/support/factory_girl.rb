require 'factory_girl_rails'
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  #runs before rspec (we think)
  config.before(:suite) do
    begin
      #resets id numbers
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.clean_with(:truncation)
      FactoryGirl.lint
    ensure
      DatabaseCleaner.clean
    end
  end
  #runs before and after
  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
  # resets the session, after each example
  config.after(:each) do
    Capybara.reset_session!
  end
end
