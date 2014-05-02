class UrltypeController < ApplicationController
  def index
    @types = [Urltype.first, Urltype.find(2)]
  end
end
