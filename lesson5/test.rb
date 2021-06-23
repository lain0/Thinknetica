# frozen_string_literal: true

# test.rb
require 'byebug'
require_relative 'storage'
require_relative 'menu_helper'
Array.include MenuHelper::Array
include MenuHelper

def stty
  state = `stty -g`
  `stty raw -echo -icanon isig`
  $stdin.getc.chr
ensure
  `stty #{state}`
end

def p1
  puts 'p1'
end

def p2
  puts 'p2'
end

trains = [:p1, :p2]
h = trains.a_to_h
p "keys: #{h.keys}"
p h.values
puts 'press keys'
i = 0
loop do
  str = stty
  puts "#{str} === #{i}"
  send(h[str.to_i]) if h[str.to_i]
  break puts "q" if 'e'.include?(str)
  i += 1
end

puts 'END'
