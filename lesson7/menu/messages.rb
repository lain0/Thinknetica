# frozen_string_literal: true

module Messages
  MESSAGE_WELCOME = 'Welcome to Railway control'
  MESSAGE_MAIN = 'Press: "s" to create Station, "t" to control train, "r" to control routes, "c" to control routes, "l" to list all stations, trains and routes , "a" to add cars to train, "d" to delete last car from train, "m" to move train submenu, "e" or "q" to exit, "h" for this help!'
  MESSAGE_TYPE = 'Chose type: "c" for cargo or "p" for passenger'
  MESSAGE_TYPE_ERROR = 'Allowed types are only Cargo and Passenger, '
  MESSAGE_NUMBER = 'Enter number '
  MESSAGE_STATION_NAME = 'Enter the name of Station like Leningrad or Moscow'

  MESSAGE_ROUTES_CONTROL = 'Press "c" to create route or "a" to add statoin or "d" to delete station'
  MESSAGE_ROUTES_CREATE = 'Create Stations for new Route'
  MESSAGE_ROUTES_ADD_REMOVE_STATIONS = 'Add/Remove stations from Route by a/r'
  MESSAGE_ROUTES_CREATE_OR_SELECT = 'Press "c" to create New Route or "s" to select from created'
  MESSAGE_ROUTES_REMOVE_STATIONS_FAILED = 'No intermediate stations to delete on thins route'
  MESSAGE_TRAIN_CREATE = 'Lets create Train'
  MESSAGE_TRAIN_NUMBER = 'Enter trains number'
  MESSAGE_TRAIN_SELECT = 'Select train'
  MESSAGE_TRAIN_MOVE = 'Press n/p to move train next or prev station'
  MESSAGE_TRAIN_MOVE_FAILED = 'No Route for Train'
  MESSAGE_TRAIN_SET_ROUTE = ''
  MESSAGE_TRAIN_CURRENT_STATION = 'Current train station is'
  MESSAGE_CAR_ADD_REMOVE = 'Press "a" or "d" to add or remove cars from Train'
  MESSAGE_CAR_ADD_SET_ROUTE = 'of car'
  MESSAGE_CAR_VOLUME = 'of volume'
  MESSAGE_CAR_SEATS = 'of seats'
  MESSAGE_CAR_UNHOOK_FAILED = 'No cars in this train, add cars first'
  MESSAGE_SUCCESSFULLY_CREATED = ' was successfully created!'
end
