require File.expand_path('../boot', __FILE__)

#require 'rails/all'
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
#require "active_resource/railtie"
require "sprockets/railtie"

if defined?(Bundler)
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # Bundler.require(:default, :assets, Rails.env)
end

module MundoTornado 
  class Application < Rails::Application
    config.autoload_paths += %W(#{config.root}/lib/renders)
    config.autoload_paths += %W(
      #{config.root}/app/controllers/concerns
      #{config.root}/app/models/concerns
    )


    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :es

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password, :password_confirmation]

    # config.active_record.schema_format = :sql

    # Enforce whitelist mode for mass assignment.
    config.active_record.whitelist_attributes = true

    # Enable the asset pipeline
    config.assets.enabled = true
    config.assets.initialize_on_precompile = false
    config.assets.version = '1.0'
  end
end
