class UrltypeController < ApplicationController
  def index
    @types = Urltype.all
  end
end
