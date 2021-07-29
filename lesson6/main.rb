#!/usr/bin/env ruby
# main.rb
# frozen_string_literal: true

require 'byebug'
require_relative 'route'
require_relative 'station'
# require_relative 'cargo'
# require_relative 'passenger'
require_relative 'train'
require_relative 'train_cargo'
require_relative 'train_passenger'
require_relative 'car'
require_relative 'car_cargo'
require_relative 'car_passenger'
require_relative 'storage'
require_relative 'menu'

EXIT_CHARS = %w[e у q й].freeze

puts Menu::MESSAGE_WELCOME
loop do
  trap('INT') { exit(130) }         # quiet exit by Ctr^C
  m = Menu.new                      # m to break loop
  break if EXIT_CHARS.include?(m.str)
end
