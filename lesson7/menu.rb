# frozen_string_literal: true

require_relative 'storage'
require_relative 'menu/helper'
require_relative 'menu/messages'

# Menu instance method for every Station/Route/Train
class Menu < Storage
  include Messages
  Array.include Helper::Array
  attr_reader :str # for exit from main loop by 'e' or 'q'

  def initialize
    puts MESSAGE_MAIN
    @str = stty
    call
  end

  def call
    menu = {
      's' => :station_create,
      'r' => :route_create,
      'c' => :route_control,
      't' => :train_create,
      'p' => :train_set_route,
      'm' => :train_move,
      'a' => :train_car_add,
      'u' => :train_car_unhook,
      'l' => :list,
      'w' => :cars_in_trains,
      'b' => :trains_on_station,
      'o' => :occupy_place_in_car,
      'e' => :exit
    }
    menu.default = :new
    send(menu[@str])
  end

  def station_create
    puts "#{MESSAGE_STATION_NAME} #{yield if block_given?}"
    station = Station.new(gets.strip)
    @@stations.push(station)
    puts "Station #{station}#{MESSAGE_SUCCESSFULLY_CREATED}"
    station
  rescue StandardError => e
    puts e.message
    station_create
  end

  def train_create
    puts yield if block_given?
    type = type_select
    number = enter_number { 'for train' }
    case type
    when Train::TYPES[0]
      train = TrainCargo.new(number)
    when Train::TYPES[1]
      train = TrainPassenger.new(number)
    end
    @@trains.push(train)
    puts "Train #{train}#{MESSAGE_SUCCESSFULLY_CREATED}"
    train
  rescue StandardError => e
    puts e.message
    train_create
  end

  def route_create
    puts MESSAGE_ROUTES_CREATE
    route = Route.new([station_create { 'as station_start' },
                       station_create { 'as station_end' }])
    @@routes.push(route)
    puts "Route #{route}#{MESSAGE_SUCCESSFULLY_CREATED}"
    route
  end

  def route_control
    puts MESSAGE_ROUTES_CONTROL
    str = stty
    if %w[c с].include?(str)
      route_create
    elsif %w[a ф].include?(str)
      route = route_selected_or_create
      route.add(station_create { 'as new intermediate station' })
    elsif %w[d в].include?(str)
      route = route_selected_or_create
      p "route OK=> #{route}"
      if route.stations.length == 2
        return puts MESSAGE_ROUTES_REMOVE_STATIONS_FAILED

      elsif route.stations.length > 2
        station = route.stations[select_id_from_array(route.stations.intermitiate) + 1]
        return route.remove(station)
      end
    end
  end

  def train_set_route
    train = train_selected_or_create
    p train
    p train.route(route_selected_or_create)
    train
  end

  def train_move
    train = train_set_route
    puts "#{MESSAGE_TRAIN_MOVE} #{train.station}"
    case stty
    when 'n', 'т'
      train.move_next_station
      puts "#{MESSAGE_TRAIN_CURRENT_STATION} #{train.station.name}"
    when 'p', 'з'
      train.move_prev_station
      puts "#{MESSAGE_TRAIN_CURRENT_STATION} #{train.station.name}"
    end
  end

  def train_selected_or_create
    return train_create { MESSAGE_TRAIN_CREATE } if @@trains.empty?

    return @@trains[0] if @@trains.length == 1

    puts "#{MESSAGE_TRAIN_SELECT} from #{@@trains}" # if @@trains.length > 1
    @@trains[select_id_from_array(@@trains)]
  end

  def route_selected_or_create
    return route_create { MESSAGE_ROUTES_CREATE } if @@routes.empty?

    puts MESSAGE_ROUTES_CREATE_OR_SELECT
    case stty
    when 'c'
      return route_create { MESSAGE_ROUTES_CREATE }

    when 's'
      route_id = select_id_from_array(@@routes)
      @@routes[route_id]
    end
  end

  def stations_select_or_create
    return station_create { MESSAGE_STATION_NAME } if @@stations.empty?

    @@stations[select_id_from_array(train.cars)]
  end

  def train_car_add
    train_selected_or_create if @@trains.length.zero?
    train = train_selected_or_create
    if train.type == Train::TYPES[0]
      return train.car_add(CarCargo.new(
                             enter_number { "#{MESSAGE_CAR_ADD_SET_ROUTE} in format: #{Car::NUMBER_FORMAT}" },
                             enter_number { MESSAGE_CAR_VOLUME }
                           ))

    end

    if train.type == Train::TYPES[1]
      return train.car_add(CarPassenger.new(
                             enter_number { MESSAGE_CAR_ADD_SET_ROUTE },
                             enter_number { MESSAGE_CAR_SEATS }
                           ))

    end
  rescue StandardError => e
    puts "#{__callee__} #{e.message}"
    train_car_add
  end

  def train_car_unhook
    train = train_selected_or_create
    if train.cars.length.zero?
      return puts MESSAGE_CAR_UNHOOK_FAILED

    else
      car_id = select_id_from_array(train.cars)
      train.cars.delete_at car_id
    end
  end

  def cars_in_trains
    @@trains.each { |train| train.all_cars { |car| puts car } }
  end

  def trains_on_station
    @@stations.each { |station| station.all_trains { |train| puts train } }
  end

  def occupy_place_in_car
    puts "#{MESSAGE_TRAIN_SELECT} from #{@@trains}" # if @@trains.length > 1
    train = @@trains[select_id_from_array(@@trains)]
    car = train.cars[select_id_from_array(train.cars)]
    if train.type == 'Cargo'
      puts "Enter 1 - #{car.volume_free} Number to occupy"
      v = gets.strip.to_i
      if v < car.volume_free
        return car.take_volume { v }

      else
        puts 'no such space in car'
      end
    end
    if train.type == 'Passenger'
      puts "Enter 1 - #{car.seats_free} Number to occupy"
      v = gets.strip.to_i
      if v < car.seats_free
        return car.take_seat { v }

      else
        puts 'no such space in car'
      end
    end
  end

  def new
    Menu.new
  end

  private

  def select_id_from_array(array)
    loop do
      array.iterator
      str = stty
      break str.to_i if array.a_to_h[str.to_i]
    end
  end

  def enter_number
    puts "#{MESSAGE_NUMBER} #{yield if block_given?}"
    gets.strip.to_str
  end

  # TYPES the same for car and Train
  def type_select
    puts "#{yield if block_given?}#{MESSAGE_TYPE}"
    str = stty
    if %w[c с].include?(str)
      Train::TYPES[0]
    elsif %w[p з].include?(str)
      Train::TYPES[1]
    else
      type_select { MESSAGE_TYPE_ERROR }
    end
  end

  def stty
    state = `stty -g`
    `stty raw -echo -icanon isig`
    $stdin.getc.chr
  ensure
    `stty #{state}`
  end
end
