# frozen_string_literal: true

require_relative 'modules/instance_counter'

# Класс Route (Маршрут):
# Имеет начальную и конечную станцию, а также список промежуточных станций.
# Начальная и конечная станции указываютсся при создании маршрута, а
# промежуточные могут добавляться между ними.
# Может добавлять промежуточную станцию в список
# Может удалять промежуточную станцию из списка
# Может выводить список всех станций по-порядку от начальной до конечной
class Route
  include InstanceCounter
  def initialize(stations)
    register_instance
    @station_start = stations.first
    @station_end = stations.last
    @intermediate_stations = []
  end

  def add(station)
    @intermediate_stations << station
  end

  def remove(station)
    @intermediate_stations.delete(station)
  end

  def stations
    [@station_start, @intermediate_stations, @station_end].flatten(1)
  end
end
