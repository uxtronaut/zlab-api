ENV['RAILS_ENV'] ||= 'test'
ENV['CORS_ORIGIN'] = '*'
require_relative '../config/environment'
require 'rails/test_help'
require 'mocha/minitest'

DatabaseCleaner.strategy = :truncation

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods

  before :each do
    DatabaseCleaner.start
  end

  after :each do
    DatabaseCleaner.clean
  end
end
