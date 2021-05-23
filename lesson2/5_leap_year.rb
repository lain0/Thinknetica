#!/usr/bin/env ruby
# 5_leap_year.rb
# frozen_string_literal: true

puts 'Input day'
day = gets.to_i
puts 'Input month'
month = gets.to_i
puts 'Input Year'
year = gets.to_i

day_number = day

months = [0, 31, 28, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

months[2] = 29 if ((year % 4).zero? && year % 100 != 0) || (year % 400).zero?

months.take(month).each_with_index do |_, i|
  day_number += months[i]
end
p "#{day} of #{month} is #{day_number} day of #{year} year"
