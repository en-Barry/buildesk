source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'rails', '6.0.3.5'

# Assets
gem 'bootstrap-sass'
gem 'font-awesome-sass'
gem 'sass-rails'
gem 'webpacker', '~> 4.0'

# Database
gem 'mysql2', '>= 0.4.4'
gem 'redis-rails'

# App server
gem 'puma', '~> 4.1'

# UI/UX
gem 'html2slim'
gem 'jbuilder', '~> 2.7'
gem 'rails-i18n', '>= 5.1.3'
gem 'slim-rails'
# gem 'turbolinks', '~> 5'

# Authentication
gem 'sorcery'

# Form
gem 'simple_form'

# Seeds
gem 'faker'

# Uploader
gem 'carrierwave', '2.1.1'

# Storage
gem 'mini_magick', '4.11.0'

# Model
gem 'enum_help'

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
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-rails'

  # CLI
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Code analyze
  gem 'rails_best_practices'
  gem 'rubocop'
  gem 'rubocop-checkstyle_formatter'
  gem 'rubocop-rails'
  gem 'scss_lint'
  gem 'slim_lint'

  # Test
  gem 'factory_bot_rails', '~> 6.1.0'
  gem 'rspec-rails', '~> 4.0.1'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'foreman'
  gem 'listen', '~> 3.2'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
