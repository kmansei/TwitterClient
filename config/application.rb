require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)
Dotenv::Railtie.load

module Ballooon
  class Application < Rails::Application
    #lib以下をautoloadする
    config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths += Dir["#{config.root}/lib/**/"]
  end
end
