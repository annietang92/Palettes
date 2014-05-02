class UrltypeController < ApplicationController
  def index
    @types = [Urltype.first, Urltype.find(2), Urltype.find(3), Urltype.find(4)]
  end
end
