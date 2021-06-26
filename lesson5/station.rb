# frozen_string_literal: true

require_relative 'modules/instance_counter'

# class Station (Станция):
# Имеет название, которое указывается при ее создании
# Может принимать поезда (по одному за раз)
# Может возвращать список всех поездов на станции, находящиеся в текущий момент
# Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
# Может отправлять поезда (по одному за раз, при этом, поезд удаляется
# из списка поездов, находящихся на станции).
class Station
  include InstanceCounter
  # attr_accessor :trains
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def receive_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train)
  end

  def trains_by_type(type = nil)
    @trains.select { |t| t.type == type }
  end
end
