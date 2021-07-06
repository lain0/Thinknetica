# frozen_string_literal: true

require_relative 'modules/instance_counter'
require_relative 'modules/manufacturer_name'

# class Train (Поезд):
# Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество
# вагонов, эти данные указываются при создании экземпляра класса
# Может набирать скорость
# Может возвращать текущую скорость
# Может тормозить (сбрасывать скорость до нуля)
# Может возвращать количество вагонов
# Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто
# увеличивает или уменьшает количество вагонов).
# Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
# Может принимать маршрут следования (объект класса Route).
# При назначении маршрута поезду, поезд автоматически помещается на первую
# станцию в маршруте.
# Может перемещаться между станциями, указанными в маршруте.
# Перемещение возможно вперед и назад, но только на 1 станцию за раз.
# Возвращать предыдущую станцию, текущую, следующую, на основе маршрута
class Train
  include InstanceCounter
  include ManufacturerName
  attr_accessor :speed
  attr_reader :cars, :station, :number, :type

  def initialize(number, type)
    register_instance
    @number = number
    @type = type
    @cars = []
    @speed = 0
  end

  def stop
    @speed = 0
  end

  def car_add(car)
    @cars.push(car) if @speed.zero? && @type == car.type && !@cars.include?(car)
  end

  def car_remove(car)
    @cars.delete(car) if @speed.zero?
  end

  def route(route)
    @route = route
    @station = route.stations.first
    @station.trains << self unless @station.trains.include? self
  end

  def move_next_station
    return unless next_station

    change_station(next_station_id)
  end

  def move_prev_station
    return unless prev_station

    change_station(prev_station_id)
  end

  def next_station
    return nil if next_station_id.nil?

    @route.stations[next_station_id] if next_station_id != station_id
  end

  def prev_station
    return nil if prev_station_id.nil?

    @route.stations[prev_station_id] if prev_station_id != station_id
  end

  def self.find(number)
    @@trains.find { |x| x.number == number }
  end

  protected  # has sub-classes

  def station_id
    @route.stations.index(@station)
  end

  def next_station_id
    station_id + 1 if @route.stations.size > station_id + 1
  end

  def prev_station_id
    station_id - 1 if station_id.positive?
  end

  def change_station(station_id)
    @station.send_train(self)
    @station = @route.stations[station_id]
    @station.receive_train(self)
  end
end
