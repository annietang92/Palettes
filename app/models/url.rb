class Url < ActiveRecord::Base
  has_many :colors, through: :relationships
  has_many :relationships

  has_many :urltypes, through: :url_type_relationships
  has_many :url_type_relationships

  attr_accessor :urltype

  def display_name
    display=''

    if self.url.match('http://www.')
      display = self.url
      display[0..10] = ''
    elsif self.url.match('https://www.')
      display = self.url
      display[0..11] = ''
    elsif self.url.match('http://')
      display = self.url
      display[0..6] = ''
    elsif self.url.match('https://')
      display = self.url
      display[0..7] = ''
    else
      display = self.url
    end

    return display
    
  end
end

