source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.2'

gem 'bootstrap-sass', '~> 3.3.7'
gem 'carrierwave'
gem 'cloudinary'
gem 'coffee-rails'
gem 'devise'
gem 'haml'
gem 'jbuilder'
gem 'jquery-rails'
gem 'kaminari'
gem 'mini_magick'
gem 'omniauth'
gem 'pg'
gem 'puma'
gem 'rails', '~> 5.1.2'
gem 'redis'
gem 'resque'
gem 'sass-rails'
gem 'sendgrid-ruby'
gem 'therubyracer'
gem 'uglifier'

group :test, :development do
  gem 'dotenv-rails'
  gem 'faker'
  gem 'letter_opener'
  gem 'listen'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.2'
  gem 'rspec-rails', '~> 3.6'
end

group :test do
  gem 'database_cleaner', '~> 1.6', '>= 1.6.1'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'simplecov', require: false
end

group :production do
  gem 'rails_12factor'
end
