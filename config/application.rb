require File.expand_path('../boot', __FILE__)

require "sprockets/railtie"

require 'rails/all'
Bundler.require(*Rails.groups)

module PairStair
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
  end
end
