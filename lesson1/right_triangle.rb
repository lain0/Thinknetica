#!/usr/bin/env ruby
# right_triangle.rb
# frozen_string_literal: true

# equilateral 3 [3, 3, 3]
# isosceles 2 [4, 4, 3]
# right [3, 4, 5]

class String
  def red;        "\e[31m#{self}\e[0m" end
  def green;      "\e[32m#{self}\e[0m" end
  def blue;       "\e[34m#{self}\e[0m" end
  def magenta;    "\e[35m#{self}\e[0m" end
  def cyan;       "\e[36m#{self}\e[0m" end
end
def gets_to_f
  puts yield
  gets.chomp.to_f
end

a = gets_to_f { 'Enter the length of side a of the triangle' }
b = gets_to_f { 'Enter the length of side b of the triangle' }
c = gets_to_f { 'Enter the length of side c of the triangle' }
triangle = [a, b, c]
def triangle?(triangle)
  triangle.max < triangle.sum / 2.0
end

if triangle?(triangle)
  if triangle.sort.uniq.length == 1
    puts 'Triangle is equilateral'.green
  elsif triangle.sort.uniq.length == 2
    puts 'Triangle is isosceles'.magenta
  elsif triangle.max**2 == triangle.min(2)[0]**2 + triangle.min(2)[1]**2
    puts 'Triangle is right'.cyan
  else
    puts "It\'s just triangle".blue
  end
else
  puts "It\'is NOT triangle".red
end
