
# configure_server for running worker performs from terminal or dashboard???
Sidekiq.configure_server do |config|
    config.redis = { url: 'redis://localhost:6379', namespace: 'test_sidekiq' }
end

# configure_client for running worker performs in rails code
# IMPORTANT: The puts will show up in the terminal not the rails server terminal
Sidekiq.configure_client do |config|
    config.redis = { url: 'redis://localhost:6379', namespace: 'test_sidekiq' }
end
