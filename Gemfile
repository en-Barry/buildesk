source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'rails', '6.0.3.5'

# Assets
gem 'webpacker', '~> 4.0'
gem 'sass-rails'

# Database
gem 'mysql2', '>= 0.4.4'
gem 'redis-rails'

# App server
gem 'puma', '~> 4.1'

# UI/UX
gem 'jbuilder', '~> 2.7'
# gem 'turbolinks', '~> 5'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'

# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Debugger
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'better_errors'
  gem 'binding_of_caller'

  #CLI
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec'

  # Code analyze
  gem 'rubocop'
  gem 'rubocop-rails'
  gem 'rubocop-checkstyle_formatter'
  gem 'rails_best_practices'
  gem 'scss_lint'
  gem 'slim_lint'

  # Test
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  gem 'foreman'
end

group :test do
  gem 'capybara'
  gem 'faker'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
