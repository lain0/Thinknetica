# frozen_string_literal: true

class Storage
  @@stations = []
  @@trains = []
  @@routes = []

  def list1
    puts "All Stations:=#{@@stations.length} #{@@stations}"
    puts "All Trains:=#{@@trains.length} #{@@trains}"
    puts "All Routes:=#{@@routes.length} #{@@routes}"
  end
  def list
    puts "All Stations:=#{@@stations.length} #{@@stations}\nAll Trains:=#{@@trains.length} #{@@trains}\nAll Routes:=#{@@routes.length} #{@@routes}"
  end
end
