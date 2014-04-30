class Color < ActiveRecord::Base
  has_many :urls, through: :relationships
  has_many :relationships

  validates :hex, presence: true, uniqueness: true

  def self.top_color
    top = Color.all.find_all {|a| a.urls.count > 20 && !a.is_black?}
    # top = Color.all
    top.sort! { |a,b| a.urls.count <=> b.urls.count }
    return top.reverse
  end

  def is_black?
    r = self.hex[0..1]
    g = self.hex[2..3]
    b = self.hex[4..5]
    if r == g && r == b
      return true
    else
      return false
    end
  end

end
