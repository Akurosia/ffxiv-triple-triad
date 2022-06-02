require_relative 'boot'

require "rails"
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_view/railtie"
require "sprockets/railtie"

# ActionMailer is required for Devise as per https://github.com/heartcombo/devise/issues/5140
require "action_mailer/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FfxivTripleTriad
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Don't generate system test files.
    config.generators.system_tests = nil

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*{.yml}')]
    config.i18n.enforce_available_locales = false

    config.cache_store = :file_store, 'tmp/cache'

    config.assets.paths << Rails.root.join("app", "assets", "fonts")

    config.session_store :cookie_store, key: '_ffxiv_triple_triad_session', expire_after: 1.month, same_site: :lax

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '/api/*', headers: :any, methods: [:get, :options]
      end
    end
  end
end
