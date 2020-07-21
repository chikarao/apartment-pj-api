# For gem sidekiq; refer to config/initializers/sidekiq.rb; config/sidekiq.yml;
# !!!IMPORTANT you must run terminal command to have this worker run
# to start server; run on terminal: bundle exec sidekiq -C config/sidekiq.yml -d

class HardWorker # Do not need any inheritance
# class HardWorker < ApplicationController
  include Sidekiq::Worker
  sidekiq_options queue: :test, retry: 5

  def perform(user_id, count)
    p "!!!!!!!!!!!!!!In HardWorker perform user_id, count: " + user_id.to_s + ' ' + count.to_s
    # p "!!!!!!!!!!!!!!In HardWorker perform name, ActionCable.server" + ActionCable.server.to_s
    # ActionCable.server.broadcast(channel, chat_payload_object)
    ActionCable.server.broadcast("messaging_room_#{user_id}", {message: 'hello, this is perform in app/worker/hard_worker.rb'})
    # TestBroadcastJob.perform_now('messaging_room_1', { message: 'hello'})
  end
end
