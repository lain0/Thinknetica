# frozen_string_literal: true

require_relative 'modules/instance_counter'
require_relative 'modules/validations'

# class Station (Станция):
# Имеет название, которое указывается при ее создании
# Может принимать поезда (по одному за раз)
# Может возвращать список всех поездов на станции, находящиеся в текущий момент
# Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
# Может отправлять поезда (по одному за раз, при этом, поезд удаляется
# из списка поездов, находящихся на станции).
class Station
  include InstanceCounter
  include Validations
  # attr_accessor :trains
  attr_reader :name, :trains

  NAME_FORMAT = /^(.{1,10})$/.freeze

  @@stations = []

  def initialize(name)
    register_instance
    @name = name
    @trains = []
    @@stations << self
    validate!
  end

  def self.all
    @@stations
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

  def all_trains
    @trains.each { |train| yield "#{train.number} -- #{train.type} -- #{train.cars.count}" }
  end
end
