# require 'paleta'

# single_hex = []

# (0..9).each do |hex|
#   single_hex << hex.to_s 
# end
# ('a'..'f').each do |hex|
#   single_hex << hex
# end

# single_hex.each do |hex1|
#   single_hex.each do |hex2|
#     single_hex.each do |hex3|
#       hex = hex1 + hex1 + hex2 + hex2 + hex3 + hex3
#       hex = hex.upcase
#       begin
#         color = Paleta::Color.new(:hex, hex)
#         Color.create(hex: color.hex.to_s, r: color.red.to_i, g: color.green.to_i, b: color.blue.to_i, hue: color.hue.to_i, sat: color.saturation.to_i, val: color.lightness.to_i)
#       rescue
#         next
#       end
#     end
#   end
# end

# types = [
# "Social Media",
# "Sports",
# "Travel",
# "Education",
# "Technology",
# "Deals",
# "Shopping",
# "Personal",
# "University",
# "Entertainment",
# "Finance",
# "Food & Drink",
# "Games",
# "Health",
# "Kids",
# "Medical",
# "Music",
# "News",
# "Photo & Video",
# "Reference",
# "Other"]

# for type in types
#   t = Urltype.new
#   t.name = type
#   t.save
# end

TopCache.destroy_all

for color in Color.top_color
  TopCache.create(color_id:color.id)
end


TypeCache.destroy_all

for urltype in Urltype.all
  colors = Color.top_colors_of(urltype).take(30)
  for color in colors
    TypeCache.create(urltype_id:urltype.id, color_id:color.id)
  end
end

