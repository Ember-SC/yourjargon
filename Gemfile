source 'https://rubygems.org'

gem 'rails', '3.2.3'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'ember-rails'
gem "active_model_serializers", :git => "git://github.com/josevalim/active_model_serializers.git"
gem 'foreman'
gem 'thin'
gem 'bcrypt-ruby', :require => 'bcrypt'
gem 'bootstrap-sass', '~> 2.1.0.0'

group :production do
  gem 'pg'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'jasmine', '~> 1.2.0'
  gem 'jasminerice'
  gem 'guard-jasmine'
  gem 'awesome_print'
  gem 'rb-fsevent', '~> 0.9.1'
end
