class StaticController < ApplicationController


  def index
    @colors = Color.top_color[0..6]
    @home = true
  end

  def show
    single_hex = []
    all_hex = []
    @url = Url.new

    #url
    url = 'facebook.com'
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
      begin
        css_string = open(file).read
      rescue
        next
      end

      # hex = css_string.scan(/background-color:#[0-9a-fA-F]{3,6}/)
      hex = css_string.scan(/#[0-9a-fA-F]{3,6}/)


      # puts hex
      for h in hex
        # h[0..17] = ''
        h[0] = ''
        if h.length == 3
          h = h[0] + h[0] + h[1] + h[1] + h[2] + h[2]
        end
        unless all_hex.include?(h.downcase)
           all_hex << h.downcase
        end
      end
    end

    #make palette object
    palette_r = Paleta::Palette.new()
    palette_g = Paleta::Palette.new()
    palette_b = Paleta::Palette.new()
    palette_blk = Paleta::Palette.new()

    for hex in all_hex
      begin 
        color = Paleta::Color.new(:hex, hex)
      rescue
        next
      end
      if color.red >= color.green && color.red > color.blue
        palette_r << color
      elsif color.green > color.red && color.green >= color.blue
        palette_g << color
      elsif color.blue >= color.red && color.blue > color.green
        palette_b << color
      else
        palette_blk << color
      end      
    end
    palette_r.sort! { |a,b| a.hex <=> b.hex }
    palette_g.sort! { |a,b| a.hex <=> b.hex }
    palette_b.sort! { |a,b| a.hex <=> b.hex }
    palette_blk.sort! { |a,b| a.hex <=> b.hex }

    @colors = palette_r.to_array(:hex) + palette_g.to_array(:hex) + palette_b.to_array(:hex) + palette_blk.to_array(:hex)
    
  end
end
