#!/usr/bin/env ruby
# quadratic_equation.rb
# frozen_string_literal: true

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


