# frozen_string_literal: true

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
#
# @number - random string
# @type - cargo | passenger
# @cars
#
class Train
  TYPE = %i[passanger cargo].freeze
  attr_accessor :speed
  attr_reader :cars, :station, :number, :type

  def initialize(number:, type:, cars:)
    @number = number
    @type = type
    @cars = cars
    @speed = 0
    @station = ''
    @route = ''
  end

  alias go= speed=
  alias length cars
  alias current_station station

  def stop
    @speed = 0
  end

  def car_add
    @cars += 1 if @speed.zero?
  end

  def car_remove
    @cars -= 1 if @speed.zero? && @cars.positive?
  end

  def route(route)
    @route = route
    @station = route.start_station
    @station.trains << self unless @station.trains.include? self
  end

  def move_next_station
    if @route.stations.size > station_id + 1
      @station.send_train(self)
      @station = @route.stations[next_station_id]
      @station.receive_train(self)
    else
      puts 'We are at the end point of Route'
    end
  end

  def move_prev_station
    if station_id.positive?
      @station.send_train(self)
      @station = @route.stations[prev_station_id]
      @station.receive_train(self)
    else
      puts 'We haven\'t even started yet'
    end
  end

  def next_station
    if next_station_id == station_id
      puts 'It\'s almost END station'
    else
      puts "Next station is #{@route.stations[next_station_id].name}"
    end
  end

  def prev_station
    if prev_station_id == station_id
      puts 'We haven\'t even started yet'
    else
      puts "Prev station is #{@route.stations[prev_station_id].name}"
    end
  end

  private

  def station_id
    @route.stations.index(@station)
  end

  def next_station_id
    if @route.stations.size > station_id + 1
      station_id + 1
    else
      station_id
    end
  end

  def prev_station_id
    if station_id.positive?
      station_id - 1
    else
      station_id
    end
  end
end
