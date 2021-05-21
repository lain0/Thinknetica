#!/usr/bin/env ruby
# triangle_area.rb
# frozen_string_literal: true

puts 'Enter the base of triangle'
a = gets.to_f
puts 'Enter the height of triangle'
h = gets.to_f

area = a * h / 2
puts "Triangle area is #{area}"
