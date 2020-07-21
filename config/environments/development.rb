Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false
  # config.cache_classes = true

  # Do not eager load code on boot.
  config.eager_load = false
  # config.eager_load = true
  # !!!!!!!!!!!!!!!!!!!Turn eager_load true to deal with error: ArgumentError (A copy of Api::V1::Users has been removed from the module tree but is still active!):
  # IMPORTANT: Sidekiq automatically calls eager_load! when the app is booted (really? or just boots app check);
  # So when the app tries to autoload components the compoenents there is a threading issue as sidekiq's main feature is that
  # it uses threads to perform background processing; Sidekiq uses 25 threads. Config.puma.rb has way to set activeRecord thread pool size; If set to 1, errors disappear;
  # When threads process api calls made from frontend, autoload finds API/V1 where autoload load missing constants starts looking (in API/V1)
  # When threads find other threads already loaded API/V1, the error is raised
  # Explanation of issue (no solution given): https://stackoverflow.com/questions/62927007/rails-autoload-issue-after-installing-sidekiq-argumenterror-a-copy-of-apiv1
  # Conclusion is that it is best to have eager_load true with Sidekiq installed and in multi threaded environment
  # https://stackoverflow.com/questions/37888789/what-does-rails-application-eager-load-do
  # https://github.com/mperham/sidekiq/issues/80

  # Show full error reports.
  config.consider_all_requests_local = true
 ###################################
 #Did not work in solving ArgumentError (A copy of Api::V1 has been removed from the module tree but is still active!):
  # config.cache_classes = Sidekiq.server? ? true : false
  # config.eager_load = Sidekiq.server? ? true : false
###################################

  # REDIS *****************************************
  # reference: https://github.com/redis-store/redis-rails
  # https://www.rubycommunity.org/articles/install-and-use-redis-in-rails-application
  # Enable/disable caching. By default caching is disabled.
  # if Rails.root.join('tmp/caching-dev.txt').exist?
  config.action_controller.perform_caching = true
  # take out memory_store to not be limited to that server's caching and so can be shared across multiple
  # config.cache_store = :memory_store
  #passing
  config.cache_store = :redis_store, {
    host: 'localhost',
    port: 6379,
    db: 0,
    password: ENV["REDIS_PASSWORD"]
    # namespace used if multiple applications use db
    # namespace:
  },{
  expires_in: 90.minutes
  }
  config.public_file_server.headers = {
    'Cache-Control' => "public, max-age=#{2.days.seconds.to_i}"
    }

  # else
  #   config.action_controller.perform_caching = false
  #
  #   config.cache_store = :null_store
  # end
# REDIS **********************************

# SENDGRID ********************************
config.action_mailer.raise_delivery_errors = true
config.action_mailer.default_url_options = { :host => 'localhost:3000' }
config.action_mailer.perform_deliveries = true
config.action_mailer.delivery_method = :smtp

config.action_mailer.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      =>  'apikey',
  :password       =>  ENV['SENDGRID_API_KEY'],
  :domain         => 'localhost:3000',
  :enable_starttls_auto => true
}
  # SENDGRID ********************************

  # Don't care if the mailer can't send.
  # config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load


  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
  config.after_initialize do
    Bullet.enable = true
    Bullet.console = true
    Bullet.rails_logger = true
  end

end
