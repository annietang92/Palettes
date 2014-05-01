class Urltype < ActiveRecord::Base
  has_many :urls, through: :url_type_relationships
  has_many :url_type_relationships

end
