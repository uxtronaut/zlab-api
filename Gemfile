source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails', '~> 5.2.2'
gem 'puma', '~> 3.11'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'rack-cors'
gem 'mongoid'
gem 'active_model_serializers'
gem 'rest-client'

group :development, :test do
  gem 'pry'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'minitest-spec-rails'
  gem 'mocha'
  gem 'faker'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
