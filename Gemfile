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
gem 'chartkick'
gem 'hightop'
gem 'groupdate'

group :development, :test do
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'rspec-rails'
  gem 'harry_potter_faker'
  gem 'pry'
  gem 'awesome_print'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'faker'
  gem 'materialize-rails'
  gem 'launchy'
  gem 'byebug', platform: :mri
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
