class StaticController < ApplicationController

  def show
    color = Paleta::Color.new(:hex, "5EA1EB")
    puts color.red 
    puts color.green
    puts color.blue
    puts color.hue
    puts color.saturation
    puts color.lightness
    puts color.hex

    @colors = []
    @colors << color.hex

  end
  def index
    require 'rubygems'
    require 'nokogiri'
    require 'css_parser'
    require 'httpclient'
    require 'open-uri'
    require 'open_uri_redirections'

    #url
    url = 'twitter.com'
    url_redir = ''

    url = "http://" + url

    open(url, :allow_redirections => :safe) do |r|
      url_redir = r.base_uri.to_s
    end

    # open the html
    page = Nokogiri::HTML(open(url_redir))   

    # get the links
    links = page.css('link')

    #create array for css files
    css_files = []
    
    #populate array for css files
    links.each do |link|
      if link.attribute('rel').to_s == 'stylesheet'
        puts link
        if url.match(/web.archive.org/)
          css_files << 'http://web.archive.org' + link.attribute('href').to_s
        elsif link.attribute('href').to_s[0..3] != "http"
          if link.attribute('href').to_s[0..1] == "//"
            css_files << "http:" + link.attribute('href').to_s
          elsif link.attribute('href').to_s[0] != "/" 
            css_files << url + "/" + link.attribute('href').to_s
          else
            css_files << url + link.attribute('href').to_s
          end
        else
          css_files << link.attribute('href').to_s
        end
      end
    end

    puts css_files
    if url.match(/web.archive.org/)
      css_files.shift
    end

    #print stylesheet links
    css_files.each do |css|
      puts css
    end

    all_hex = []
    all_hue_hex = []

    css_files.each do |file|
      #open the css links
      parser = CssParser::Parser.new
      begin
        parser.load_uri!(file)
      rescue 
        next
      end

      #format the css
      css_string = parser.to_s

      hex = css_string.scan(/#[0-9a-fA-F]{3,6}/)

      # puts hex
      for h in hex
        h[0] = ''
        if h.length == 3
          r = h[0]
          g = h[1]
          b = h[2]
          h = r + r + g + g + b + b
        end
        unless all_hex.include?(h.downcase)
           all_hex << h.downcase
        end
      end
    end

    #make palette object
    palette = Paleta::Palette.new()

    for hex in all_hex
      puts hex
      begin 
        color = Paleta::Color.new(:hex, hex)
        puts color.hex
      rescue
        puts "ERROR"
        puts " "
        next
      end
      palette << color
    end
    @colors = palette.to_array(:hex)

  end
end
