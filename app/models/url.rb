class Url < ActiveRecord::Base
  has_many :colors, through: :relationships
  has_many :relationships

end
