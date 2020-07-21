require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsApiApartmentPj
# module RailsApiBookReviews
  class Application < Rails::Application
    # Use the responders controller from the responders gem
    config.app_generators.scaffold_controller :responders_controller

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
    # for including lib for custom modules
    # reference: https://www.codewithjason.com/put-rails-modules/
    # config.autoload_paths += %W(#{config.root}/lib)
    # reference https://blog.arkency.com/2014/11/dont-forget-about-eager-load-when-extending-autoload/
    # IMPORTANT: auto_load looks for auto_load_paths and eager_load_paths when autoloading in development;
    # So, if want constant auto loaded in development and production that is not under /app/ put it in eager_load_paths  
    # config.eager_load_paths << Rails.root.join('lib')
    # config.middleware.insert_before 0, Rack::Cors do
    #       allow do
    #         origins '*'
    #         resource '*', :headers => :any, :methods => [:get, :post, :put, :delete]
    #       end
    #     end

    # Specify sidekiq, not async, as the default adapter for activeJob
    config.active_job.queue_adapter = :sidekiq
    # .log does not work; autoloaders is undefined
    # Rails.autoloaders.log!
    # config.logger = Logger.new(STDOUT)
#     config.action_dispatch.default_headers = {
#   'Access-Control-Allow-Credentials' => 'true',
#   'Access-Control-Allow-Origin' => '*',
#   'Access-Control-Request-Method' => '*'
# }
  end
end
