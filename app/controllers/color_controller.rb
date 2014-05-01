class ColorController < ApplicationController
  def index
    @colors = Color.all
    @colors.sort! { |a,b| b.hue <=> a.hue }
  end

  def show
    @color = Color.find(params[:id])
  end
end

