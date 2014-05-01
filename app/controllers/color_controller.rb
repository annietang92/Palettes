class ColorController < ApplicationController
  def index
    @colors = Color.all
    @colors.sort! { |a,b| b.hue <=> a.hue }
  end

  def show
    @color = Color.find(params[:id])
    color = Paleta::Color.new(:hex, @color.hex)

    begin
      spectrum = Paleta::Palette.generate(:type => :shades, :from => :color, :color => color, :size => 100)
      @spectrum = spectrum.to_array(:hex)
      
      analogous = Paleta::Palette.generate(:type => :analogous, :from => :color, :color => color, :size => 5)
      @analogous = analogous.to_array(:hex)

      comp = palette = Paleta::Palette.generate(:type => :complementary, :from => :color, :color => color, :size => 5)
      @comp = comp.to_array(:hex)

      split = Paleta::Palette.generate(:type => :split_complement, :from => :color, :color => color, :size => 5)
      @split = split.to_array(:hex)

      triad = Paleta::Palette.generate(:type => :triad, :from => :color, :color => color, :size => 3)
      @triad = triad.to_array(:hex)

      tetrad = palette = Paleta::Palette.generate(:type => :tetrad, :from => :color, :color => color, :size => 4)
      @tetrad = tetrad.to_array(:hex)
    rescue
      if @color.is_black?
        @gray_color = Color.find(2185)
        gray_color = Paleta::Color.new(:hex, @gray_color.hex)
        spectrum = Paleta::Palette.generate(:type => :shades, :from => :color, :color => gray_color, :size => 100)
        @spectrum = spectrum.to_array(:hex)
      else
        @lighter_color = color.lighten!(50) 
        lighter_color = Paleta::Color.new(:hex, @lighter_color.hex)
        spectrum = Paleta::Palette.generate(:type => :shades, :from => :color, :color => lighter_color, :size => 100)
        @spectrum = spectrum.to_array(:hex)
      end
    end
  end
end

