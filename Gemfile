source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'
gem 'bcrypt-ruby', '3.0.1'

group :development do
  gem 'rails_layout'
end

#color objects
gem 'paleta', '~> 0.2.0'

#pdfkit
gem 'pdfkit', '~> 0.6.2'

# http client
gem 'httpclient', '~> 2.3.4.1'

gem 'open_uri_redirections'

# HTML parser
gem 'nokogiri'

#CSS parser
gem 'css_parser', '~> 1.3.5'

# Use HAML for stylesheets
gem 'haml', '~> 4.0.5'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  gem 'sqlite3'
end
group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :test, :development do
  gem 'factory_girl_rails', '4.2.1'
end