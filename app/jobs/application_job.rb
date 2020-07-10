# NOTE: config.application.rb speified sidekiq as the adapter config.active_job.queue_adapter = :sidekiq

class ApplicationJob < ActiveJob::Base
end
