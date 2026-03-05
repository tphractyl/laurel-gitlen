source 'https://rubygems.org'

gem 'rails', '~> 5.2'

# Use sqlite3 as the database for Active Record
group :development do
  gem 'sqlite3'
end

# These are for Heroku.
group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'haml'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 5.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'

# Turbolinks makes following links in your web application faster.
gem 'turbolinks', '~> 5.0'

# Build JSON APIs with ease.
gem 'jbuilder', '~> 2.0'

gem 'ffi', '< 1.17' # pin for Ruby 2.7 compat
gem 'unicorn' # Use unicorn as the app server
gem 'sorcery', '~> 0.16' # Favorite auth library
gem 'newrelic_rpm' # New Relic for reporting

# Handle uploads to AWS and background processing
gem 's3_direct_upload'
gem 'paperclip', '~> 5.0'
gem 'aws-sdk', '~> 2'
gem 'sucker_punch', '~> 2.0'
