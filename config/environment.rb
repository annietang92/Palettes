# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Palettes::Application.initialize!

# Rails::Initializer.run do |config|
#   require 'pdfkit'
#   config.middleware.use PDFKit::Middleware, :print_media_type => true
# end