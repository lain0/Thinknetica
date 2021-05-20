#!/usr/bin/env ruby
# ideal_weight.rb
# frozen_string_literal: true

puts 'Как вас зовут?'
name = gets.chomp.strip.capitalize
puts 'Какой у вас рост?'
height = 0
until height != 0
  height = begin
    gets.chomp!.to_i
  rescue StandardError
    nil
  end
  puts 'нужно ввести рост цифрами' if height.zero?
end

def estimation(height)
  ideal_weight = (height - 110) * 1.15
  return ", ваш идеальный вес #{ideal_weight}" if height >= 110

  ', ваш вес уже оптимальный =)'
end

def green(name)
  "\e[32m#{name}\e[0m"
end

puts "#{green(name)}#{estimation(height)}"
