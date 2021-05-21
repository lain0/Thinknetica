#!/usr/bin/env ruby
# right_triangle.rb
# frozen_string_literal: true

# equilateral 3 [3, 3, 3]
# isosceles 2 [4, 4, 3]
# right [3, 4, 5]

puts 'Enter the length of side a of the triangle'
a = gets.to_f
puts 'Enter the length of side b of the triangle'
b = gets.to_f
puts 'Enter the length of side c of the triangle'
c = gets.to_f
triangle = [a, b, c]

if triangle.uniq.length == 1
  puts 'Triangle is equilateral'
elsif triangle.uniq.length == 2
  puts 'Triangle is isosceles'
elsif triangle.max**2 == triangle.min(2)[0]**2 + triangle.min(2)[1]**2
  puts 'Triangle is right'
else
  puts 'Just triangle or not a triangle'
end
