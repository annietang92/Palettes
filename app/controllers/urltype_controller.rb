class UrltypeController < ApplicationController
  def index
    @types = [Urltype.first, Urltype.last]
  end
end
