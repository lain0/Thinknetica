# frozen_string_literal: true

require_relative 'storage'
# Menu instance method for every Station/Route/Train
class Menu < Storage
  MESSAGE_WELCOME = 'Welcome to Railway control'
  MESSAGE_MAIN = 'Press: "s" to create Station, "t" to control train, "r" to control routes, "c" to control cars, "l" to list all stations, trains and routes , "e" to exit, "h" for this help!'
  MESSAGE_TYPE = 'chose type: "c" for cargo or "p" for passenger'
  MESSAGE_NUMBER = 'Enter number '
  MESSAGE_STATION_NAME = 'Enter the name of Station like Leningrad or Moscow'

  MESSAGE_ROUTES_CONTROL = 'Press "c" to create route or "a" to add statoin or "r" to remove station'
  MESSAGE_ROUTES_CREATE = 'Create Stations for new Route'
  MESSAGE_ROUTES_ADD_REMOVE_STATIONS = 'Add/Remove stations from Route by a/r'

  MESSAGE_TRAIN_NUMBER = 'Enter trains number'
  MESSAGE_TRAIN_SELECT_MOVE = 'Select train to move'
  MESSAGE_TRAIN_MOVE = 'Press b/f to move train back or forward from '
  MESSAGE_TRAIN_MOVE_FAILED = 'No Route for Train'
  MESSAGE_TRAIN_SET_ROUTE = ''

  MESSAGE_CAR_ADD_REMOVE = 'Press "a" or "r" to add or remove cars from Train'

  attr_reader :str # for exit from loop by 'e' or 'q'

  def initialize
    puts MESSAGE_MAIN
    @str = stty
    call
  end

  def call
    # puts @str
    case @str
    when 's', 'ы'
      station_create
    when 'r', 'к'
      route_control
    when 't', 'е'
      train_create
    when 'm', 'ь'
      train_move
    when 'p', 'з'
      train_set_route
    when 'a', 'ф'
      train_car_add
    when 'd', 'в'
      train_car_remove
    when 'l', 'д'
      p "All Stations:=#{@@stations.length} #{@@stations}"
      p "All Trains:=#{@@trains.length} #{@@trains}"
      p "All Routes:=#{@@routes.length} #{@@routes}"
    end
  end

  def station_create
    puts "#{MESSAGE_STATION_NAME} #{yield if block_given?}"
    station = Station.new(gets.strip)
    @@stations.push(station)
    station
  end

  def train_create
    type = type_select
    number = enter_number { 'for train' }
    # @@trains.push(Train.new(number, type))
    return @@trains.push(TrainCargo.new(number)) if type == Cargo::TYPE

    return @@trains.push(TrainPassenger.new(number)) if type == Passenger::TYPE
  end

  def route_create
    puts MESSAGE_ROUTES_CREATE
    route = Route.new([station_create { 'as station_start' },
                       station_create { 'as station_end' }])
    @@routes.push(route)
    route
  end

  def route_control
    puts MESSAGE_ROUTES_CONTROL
    str = stty
    if %w[c с].include?(str)
      route_create
    elsif %w[a ф].include?(str)
      puts
    elsif %w[r к].include?(str)

    end
  end

  def route_add_remove_stations

  end

  def type_select
    puts MESSAGE_TYPE
    str = stty
    if %w[c с].include?(str)
      type = Cargo::TYPE
    elsif %w[p з].include?(str)
      type = Passenger::TYPE
    end
  end

  def train_set_route
    train_selected&.route(route_create)
  end

  def train_move
    train = train_selected
    return puts MESSAGE_TRAIN_MOVE_FAILED if @@trains == [] # | train.station == nil

    puts "#{MESSAGE_TRAIN_MOVE} #{train.station}"

  end

  def train_selected
    p @@trains.length
    return @@trains[0] if @@trains.length == 1

    puts "#{MESSAGE_TRAIN_SELECT_MOVE} from #{@@trains}" if @@trains > 1
  end

  def train_car_add
    return if !train_selected

    p ">#{train_selected}<"
    p train_selected.car_add(Car.new(enter_number { 'of cars' }, train_selected.type))
  end

  def train_car_remove
    p train = train_selected.car_remove(car)
    train
  end

  def enter_number
    puts "#{MESSAGE_NUMBER} #{yield if block_given?}"
    gets.strip
  end

  def stty
    state = `stty -g`
    `stty raw -echo -icanon isig`
    $stdin.getc.chr
  ensure
    `stty #{state}`
  end
end
