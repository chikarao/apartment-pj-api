class TestBroadcastJob < ApplicationJob
  queue_as :default

  # Job is called by agreements controller via send_progress_percentage in concerns
  # perform seems to be called by perform_now or perform_later; For prgress bar, perform_now
  def perform(channel, payload_object)
    # parameters passed from send_progress_percentage

    # Calls action cable broadcast for user's channel.
    # KEY!! Sender has its own channel which is craeted when user uses refreshes to navigates to booking confirmation in the frontend
    # progress_payload_object is sent to the
    # recipient via actioncable websocket connnection addressed to the recipient's
    # own chat room. When message is received redux action updates state on the frontend.
      # p '****** in Job each channel, progress_payload_object: ' + channel.to_s + ' ' + progress_payload_object.to_s
    ActionCable.server.broadcast(channel, payload_object)
  end
end
