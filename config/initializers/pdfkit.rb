PDFKit.configure do |config|
  config.default_options = {
    :encoding      => 'UTF-8',
    :page_size     => 'Letter',
    :margin_top    => '0in',
    :margin_right  => '0in',
    :margin_bottom => '0in',
    :margin_left   => '0in',
    :disable_javascript => true,
    :print_media_type => true,
    :ignore_load_errors => true
  }
  config.wkhtmltopdf = '/Users/annietang/.rvm/gems/ruby-2.1.1/bin/wkhtmltopdf' if Rails.env.development?
end

