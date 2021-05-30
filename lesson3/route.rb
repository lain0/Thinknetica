# frozen_string_literal: true

# Класс Route (Маршрут):
# Имеет начальную и конечную станцию, а также список промежуточных станций.
# Начальная и конечная станции указываютсся при создании маршрута, а
# промежуточные могут добавляться между ними.
# Может добавлять промежуточную станцию в список
# Может удалять промежуточную станцию из списка
# Может выводить список всех станций по-порядку от начальной до конечной
class Route
  attr_reader :start_station, :end_station, :intermediate_stations, :stations

  def initialize(stations)
    @start_station = stations.first
    @end_station = stations.last
    @intermediate_stations = []
    @stations = compute_stations
  end

  def add(station)
    @intermediate_stations << station
    compute_stations
  end

  def remove(station)
    @intermediate_stations.delete(station)
    compute_stations
  end

  private

  def compute_stations
    @stations = [@start_station, @intermediate_stations, @end_station].flatten(1)
  end
end
