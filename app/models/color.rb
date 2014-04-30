class Color < ActiveRecord::Base
  has_many :urls, through: :relationships
  has_many :relationships
end
