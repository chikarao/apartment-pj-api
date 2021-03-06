source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.5'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors', :require => 'rack/cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'bullet', '~>5.6.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# reference: https://github.com/heartcombo/devise/issues/4630
# gem 'devise', '~> 4.3.0'
gem 'devise', git: 'https://github.com/plataformatec/devise'
gem 'simple_token_authentication', '~> 1.0' # see semver.org
gem 'koala', '~> 3.0.0'

gem 'faker'
gem 'active_model_serializers', '~> 0.10.0'
gem 'counter_culture', '~> 1.8'
gem 'paperclip', '~> 5.0.0'
gem 'figaro'
gem 'cloudinary'
gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'
gem 'prawn'
# reponders installed for prawn
gem 'responders'
gem 'combine_pdf'

gem 'redis-rails'
# redis 4.0 is installed as part of redis-rails
# gem 'redis'
gem 'redis-namespace'
# gem 'redis-rack-cache`
gem 'sidekiq'
