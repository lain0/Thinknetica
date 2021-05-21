#!/usr/bin/env ruby
# ideal_weight.rb
# frozen_string_literal: true

puts 'Как вас зовут?'
name = gets.chomp.strip.capitalize
puts 'Какой у вас рост?'
height = gets.to_i

ideal_weight = (height - 110) * 1.15

if height >= 110
  puts "#{name}, ваш идеальный вес #{ideal_weight}"
else
  puts "#{name}, ваш вес уже оптимальный!"
end
