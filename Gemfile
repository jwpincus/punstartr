source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.2'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt'
gem 'sorcery'
gem 'rails-erd'
gem 'twilio-ruby'
gem 'figaro'
gem 'simplecov', :require => false, :group => :test
gem 'will_paginate'
gem 'active_model_serializers', '~> 0.10.0'
gem 'owlcarousel-rails'
gem 'materialize-rails'
gem 'faker'
gem 'harry_potter_faker'
gem 'sidekiq'
gem 'redis'

group :development, :test do
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'rspec-rails'
  gem 'pry'
  gem 'awesome_print'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'byebug', platform: :mri
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
