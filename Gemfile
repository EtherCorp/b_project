source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

#Ruby driver for MongoDB http://api.mongodb.org/ruby
gem 'mongo', '~> 2.4.3'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'mechanize', '~> 2.7.5'
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

#Grape for API
#An opinionated framework for creating REST-like APIs in Ruby.
gem 'grape', '~> 1.0.1'
# An API focused facade that sits on top of an object model.
gem 'grape-entity', '~> 0.6.1'
# Add routes printing for Grape with Rails 
gem 'grape_on_rails_routes', '~> 0.3.2'

# Devise for users management
gem 'devise', '~> 4.3.0'
gem 'devise_token_auth', '~> 0.1.42'
gem 'omniauth', '~> 1.6.1'


# Gem for external API communication
gem 'faraday', '~> 0.13.1'
gem 'faraday_middleware', '~> 0.10.1'
# Env data
gem 'dotenv-rails', require: 'dotenv/rails-now', group: [:development, :test]
# For use sidekiq how background task queue
gem 'redis', '~> 4.0.1'
gem 'sidekiq', '~> 5.0.5'