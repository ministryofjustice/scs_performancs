source 'https://rubygems.org'

ruby '2.1.5'

gem 'rails', '4.2.0'
gem 'pg'
gem 'unicorn'

gem 'haml-rails'
gem 'jquery-rails'
gem 'moj_internal_template'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

group :production do
  gem 'rails_12factor'
end

group :test do
  gem 'capybara-email', require: false
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'faker'
  gem 'rspec-mocks'
  gem 'shoulda-matchers'
  gem 'timecop'
  gem 'poltergeist'
  gem 'selenium-webdriver'
end

group :development, :test do
  gem 'byebug'
  gem 'factory_girl_rails'
  gem 'jshint'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
  gem 'site_prism'
  gem 'spring'
  gem 'web-console', '~> 2.0'
  gem 'guard-rspec'
  gem 'guard-cucumber'
  gem 'guard-rubocop'
end
