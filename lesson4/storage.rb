# frozen_string_literal: true

class Storage
  @@stations = []
  @@trains = []
  @@routes = []

  def list
    p "All Stations:=#{@@stations.length} #{@@stations}"
    p "All Trains:=#{@@trains.length} #{@@trains}"
    p "All Routes:=#{@@routes.length} #{@@routes}"
  end
end
