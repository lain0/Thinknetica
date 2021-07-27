# frozen_string_literal: true

# require_relative 'passenger'

# CarPassenger
class CarPassenger < Car
  # include Passenger
  def initialize(number)
    @type = TYPES[0]
    super(number, @type)
  end
end
