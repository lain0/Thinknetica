#!/usr/bin/env ruby
# 1_year.rb
# frozen_string_literal: true

year = {
  jan: 31,
  feb: 28,
  mar: 31,
  apr: 30,
  may: 31,
  jun: 30,
  jul: 31,
  aug: 31,
  sep: 30,
  oct: 31,
  nov: 30,
  dec: 31
}
# month30 = []

# year.select { |k, v| month30.push(k) if v == 30 }
# month30.each { |m| puts m }
year.each do |month, days|
  puts month if days == 30
end
