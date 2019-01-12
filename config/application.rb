require_relative 'boot'

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "action_controller/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module ZPubApi
  class Application < Rails::Application
    config.load_defaults 5.2

    config.time_zone = 'Mountain Time (US & Canada)'

    config.api_only = true
  end
end
