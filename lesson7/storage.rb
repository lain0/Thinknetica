# frozen_string_literal: true

class Storage
  @stations ||= []
  @trains ||= []
  @routes ||= []

  class << self
    attr_accessor :routes, :stations, :trains
  end

  def self.list
    puts "All Stations:=#{@stations.length} #{@stations}"
    puts "All Trains:=#{@trains.length} #{@trains}"
    puts "All Routes:=#{@routes.length} #{@routes}"
  end
end
