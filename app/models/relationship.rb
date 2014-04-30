class Relationship < ActiveRecord::Base
  belongs_to :url
  belongs_to :color
end
