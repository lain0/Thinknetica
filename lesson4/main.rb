#!/usr/bin/env ruby
# main.rb
# frozen_string_literal: true

require 'byebug'
require_relative 'route'
require_relative 'station'
require_relative 'cargo'
require_relative 'passenger'
require_relative 'train'
require_relative 'train_cargo'
require_relative 'train_passenger'
require_relative 'menu'

$stations = []
$trains = []
$routes = []

puts Menu::MESSAGE_WELCOME

loop do
  trap('INT') { exit(130) }
  m = Menu.new
  # puts "#{m.str}"
  break if %w[e у].include?(m.str)
end

exit


loop do

  # a = gets.strip
  str = stty
  if %w[s ы].include? str
    puts MESSAGE_STATIONS_NAME
    stations.push(Station.new(gets.strip))
  end
  p stations
  p str.chr
  if %w[r к].include? str
    puts MESSAGE_ROUTS_CONTROL
    routes.push(Route.new(['123', '321']))
    p routes
  end
  if %w[t е].include?(str)
    puts MESSAGE_TRAIN

    puts MESSAGE_TYPE
    str = stty
    if %w[c с].include?(str)
      type = Cargo::TYPE
    elsif %w[p з].include?(str)
      type = Passenger::TYPE
    end
    puts type
    p trains
  end
  break if %w[e у].include?(str)
  # sleep 1
end
