class UrlTypeRelationship < ActiveRecord::Base
  belongs_to :url
  belongs_to :urltype
end
