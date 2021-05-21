#!/usr/bin/env ruby
# quadratic_equation.rb
# frozen_string_literal: true

# [1, 7, -12]
# [1, 4, 4]

puts 'Enter a'
a = gets.to_f
puts 'Enter b'
b = gets.to_f
puts 'Enter c'
c = gets.to_f

discriminant = b**2 - 4 * a * c
disc_text = "Дискриминант = #{discriminant}"

if discriminant.negative?
  puts "#{disc_text}, Корней нет"
elsif discriminant.positive?
  x1 = (-b + Math.sqrt(discriminant)) / (2 * a)
  x2 = (-b - Math.sqrt(discriminant)) / (2 * a)
  puts "#{disc_text}, x1 = #{x1}, x2 = #{x2}"
elsif discriminant.zero?
  x = -b / (2 * a)
  puts "#{disc_text}, x1=x2 = #{x}"
end
