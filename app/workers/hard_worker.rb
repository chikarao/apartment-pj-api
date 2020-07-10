# For gem sidekiq; refer to config/initializers/sidekiq.rb; config/sidekiq.yml;
# to start server; run on terminal: bundle exec sidekiq -C config/sidekiq.yml -d

class HardWorker < ApplicationController
  include Sidekiq::Worker
  sidekiq_options queue: :test, retry: 5

  def perform(user_id, count)
    p "!!!!!!!!!!!!!!In HardWorker perform user_id, count: " + user_id.to_s + ' ' + count.to_s
    # p "!!!!!!!!!!!!!!In HardWorker perform name, ActionCable.server" + ActionCable.server.to_s
    # ActionCable.server.broadcast(channel, chat_payload_object)
    ActionCable.server.broadcast("messaging_room_#{user_id}", {message: 'hello'})
    # TestBroadcastJob.perform_now('messaging_room_1', { message: 'hello'})
  end
end
