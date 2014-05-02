class UrltypeController < ApplicationController
  def index
    @types = [Urltype.first]
  end
end
