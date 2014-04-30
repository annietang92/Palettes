# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Color(id: integer, 
#   hex: string, 
#   r: integer, 
#   g: integer, 
#   b: integer, 
#   hue: string, 
#   val: integer, 
#   sat: integer, 
#   created_at: datetime, 
#   updated_at: datetime)


require 'paleta'

single_hex = []

(0..9).each do |hex|
  single_hex << hex.to_s 
end
('a'..'f').each do |hex|
  single_hex << hex
end

single_hex.each do |hex1|
  single_hex.each do |hex2|
    single_hex.each do |hex3|
      hex = hex1 + hex1 + hex2 + hex2 + hex3 + hex3
      hex = hex.upcase
      begin
        color = Paleta::Color.new(:hex, hex)
        Color.create(hex: color.hex.to_s, r: color.red.to_i, g: color.green.to_i, b: color.blue.to_i, hue: color.hue.to_i, sat: color.saturation.to_i, val: color.lightness.to_i)
      rescue
        next
      end
    end
  end
end

# all_hex.each do |hex|
#   color = Paleta::Color.new(:hex, hex)
#   new_color = Color.new
#   new_color.hex = hex
#   new_color.r = color.red
#   new_color.g = color.green
#   new_color.b = color.blue
#   new_color.hue = color.hue
#   new_color.val = color.lightness
#   new_color.sat = color.saturation
#   new_color.save
# end