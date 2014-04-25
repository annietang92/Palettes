class StaticController < ApplicationController
  def index
    require 'rubygems'
    require 'nokogiri'
    require 'css_parser'
    require 'httpclient'
    require 'open-uri'

    #url
    url = 'http://www.facebook.com'


    httpc = HTTPClient.new
    resp = httpc.get(url)
    puts resp.header['Location']


    open(url) do |resp|
      puts resp.base_uri.to_s
    end

    # open the html
    page = Nokogiri::HTML(open(url))   

    # get the links
    links = page.css('link')

    #create array for css files
    css_files = []
    
    #populate array for css files
    links.each do |link|
      if link.attribute('rel').to_s == 'stylesheet'
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

      hex = css_string.scan(/#[0-9a-fA-F]{6}/)

      puts hex
      puts "hello"
      for h in hex
        puts h
        if h.length == 4
          r = h[1]
          g = h[2]
          b = h[3]
          h = "#" + r + r + g + g + b + b
        end
        unless all_hex.include?(h.downcase)
           all_hex << h.downcase
        end
      end
      puts file
    end
    #make color object
    #Color = Struct.new(:hex, :hue, :value)


    for this_hex in all_hex
      #remove the hash
      hex = this_hex.dup
      hex[0] = ""
      puts hex
      #get RGB
      r = hex[0..1].to_i(16);
      puts "R "+ r.to_s
      g = hex[2..3].to_i(16);
      puts "G "+g.to_s
      b = hex[4..5].to_i(16);
      puts "B "+b.to_s

      #get max and min for chroma
      max = [r,g,b].max
      puts "max " + max.to_s
      min = [r,g,b].min
      puts "min " + min.to_s

      #variables for hsv value of hex
      chr = max - min
      puts "CHR "+chr.to_s
      hue = 0
      val = max
      sat = 0

      if val > 0 && chr > 0
        #calculate saturation
        sat = chr/val
        if r == max
          puts "R MAX"
          hue = (60*((g-min)-(b-min)))/chr
          puts "HUE " + hue.to_s
          if hue < 0
            hue += 360
          end
        elsif g == max
          hue = 120+(60*((b-min)-(r-min)))/chr
        else
          hue = 240+(60*((r-min)-(g-min)))/chr
        end
      end
      all_hue_hex << hue.to_s + " " + this_hex
    end

    puts all_hue_hex

    @colors = all_hex.sort


    # #split by attribute
    # attributes = css_string.scan(/[^}]*}/)

    # for attribute in attributes
    #   if !attribute.scan(/[\S]*\s#\d{3,6}/).none?
    #     hex = attribute.scan(/[\S]*\s#\d{3,6}/)
    #     puts attribute.match(/\S*\s*{/)
    #     puts hex
    #   end
    # end


    # # open the html
    # File.open(css_files[0], "r").each_line do |line|
    #   puts " "
    #   puts line
    #   puts " "
    # end 
  end
end
