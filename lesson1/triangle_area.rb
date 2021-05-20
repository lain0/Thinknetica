#!/usr/bin/env ruby
# triangle_area.rb
# frozen_string_literal: true

def gets_to_f
  puts yield
  gets.chomp.to_f
end

a = gets_to_f { 'Enter the base of triangle' }
h = gets_to_f { 'Enter the height of triangle' }
area = String(a * h / 2).gsub(/\.0$/, '')
puts "Triangle area is #{area}"
