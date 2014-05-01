class ColorController < ApplicationController
  def new
    @hello = 'lalala'

  end
  def show
    @color = Color.find(params[:id])
  end
end

