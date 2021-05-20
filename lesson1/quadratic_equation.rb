#!/usr/bin/env ruby
# quadratic_equation.rb
# frozen_string_literal: true

# [1, 7, -12]
# [1, 4, 4]

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

a = gets_to_f { 'Enter a' }
b = gets_to_f { 'Enter b' }
c = gets_to_f { 'Enter c' }
discriminant = b**2 - 4 * a * c
disc_text = "Дискриминант = #{discriminant}"
if discriminant.negative?
  puts "#{disc_text}, Корней нет".red
elsif discriminant.positive?
  x1 = (-b + Math.sqrt(discriminant)) / (2 * a)
  x2 = (-b - Math.sqrt(discriminant)) / (2 * a)
  puts "#{disc_text}, x1 = #{x1}, x2 = #{x2}".green
elsif discriminant.zero?
  x = -b / (2 * a)
  puts "#{disc_text}, x1=x2 = #{x}".blue
end
