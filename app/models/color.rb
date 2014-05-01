class Color < ActiveRecord::Base
  has_many :urls, through: :relationships
  has_many :relationships

  validates :hex, presence: true, uniqueness: true

  def self.top_color
    top = Color.all.find_all {|a| a.urls.count > 1 && !a.is_black?}
    # top = Color.all
    top.sort! { |a,b| a.urls.count <=> b.urls.count }
    return top.reverse
  end

  def self.convert_hex_to_id(hex)
    #convert to hex
    #a = 10
    #f = 15
    first = hex[0].to_i(16)
    second = hex[2].to_i(16)
    third = hex[4].to_i(16)

    return (256 * first) + (16 * second) + third + 1
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
