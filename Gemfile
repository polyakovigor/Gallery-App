source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.2'

gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'carrierwave', '~> 1.2', '>= 1.2.1'
gem 'cloudinary', '~> 1.8', '>= 1.8.1'
gem 'coffee-rails', '~> 4.2', '>= 4.2.2'
gem 'devise', '~> 4.3'
gem 'haml', '~> 5.0', '>= 5.0.4'
gem 'jbuilder', '~> 2.7'
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'kaminari', '~> 1.1', '>= 1.1.1'
gem 'mini_magick', '~> 4.8'
gem 'omniauth', '~> 1.7', '>= 1.7.1'
gem 'pg', '~> 0.21.0'
gem 'puma', '~> 3.10'
gem 'rails', '~> 5.1', '>= 5.1.4'
gem 'redis', '~> 3.0'
gem 'resque', '~> 1.27', '>= 1.27.4'
gem 'sass-rails', '~> 5.0', '>= 5.0.6'
gem 'sendgrid-ruby'
gem 'therubyracer', '~> 0.12.3'
gem 'uglifier', '~> 3.2'

group :test, :development do
  gem 'dotenv-rails', '~> 2.2', '>= 2.2.1'
  gem 'faker', '~> 1.8', '>= 1.8.4'
  gem 'letter_opener'
  gem 'listen', '~> 3.1', '>= 3.1.5'
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
  gem 'rails_12factor', '~> 0.0.3'
end
