# frozen_string_literal: true

# Menu instance method for every Station/Route/Train
class Menu
  MESSAGE_WELCOME = 'Welcome to Railway control'
  MESSAGE_MAIN = 'Press: "s" to create Station, "t" to control train, "r" to control routes, "c" to control cars, "l" to list all stations, trains and routes , "e" to exit, "h" for this help!'
  MESSAGE_TYPE = 'chose type: "c" for cargo or "p" for passenger'
  MESSAGE_NAME = 'Enter Name'
  MESSAGE_STATIONS_NAME = 'Enter the name of Station like Leningrad'
  MESSAGE_ROUTES_CONTROL = 'Enter routes'
  MESSAGE_ROUTES_CREATE = 'Create or Select stations for new route'
  MESSAGE_TRAIN_NUMBER = 'Enter trains number'

  attr_reader :str # for exit from loop by 'e'

  def initialize
    puts MESSAGE_MAIN
    @str = stty
    menu(@str)
  end

  def menu(s)
    puts s
    case s
    when 's', 'ы'
      station_create
    when 'r', 'к'
      route_create
    when 't', 'е'
      train_create
    when 'l', 'д'
      p "All Stations:= #{$stations}"
      p "All Trains:= #{$trains}"
      p "All Routes:= #{$routes}"
    end
  end

  def station_create
    puts MESSAGE_STATIONS_NAME
    $stations.push(Station.new(gets.strip))
  end

  # def stations_list
  #   $stations
  # end

  def train_create
    type = type_select
    p type
    puts MESSAGE_TRAIN_NUMBER
    return $trains.push(TrainCargo.new(gets.strip)) if type == Cargo::TYPE

    return $trains.push(TrainPassenger.new(gets.strip)) if type == Passenger::TYPE
  end

  # def rtains_list
  #   $trains
  # end

  def route_create
    puts MESSAGE_ROUTES_CONTROL

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

  def train_set_route()

  end

  def stty
    state = `stty -g`
    `stty raw -echo -icanon isig`
    $stdin.getc.chr
  ensure
    `stty #{state}`
  end
end
