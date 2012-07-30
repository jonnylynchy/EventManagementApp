source 'https://rubygems.org'

gem 'rails', '3.2.6'
gem 'pg'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'haml-rails'
gem 'jquery-rails'

# Deploy with Capistrano
group :development do
  #gem 'rvm-capistrano'
  gem 'capistrano'
  gem 'rails3-generators'
end

group :development, :test do
  gem 'factory_girl_rails'
end

group :test do
  gem 'shoulda'
  gem "minitest", "~> 2.10.0"
  gem "turn", "~> 0.8.3"
  gem 'test-unit', '~> 2.0.0'  
  gem 'autotest-rails'
end