# frozen_string_literal: true

require_relative 'passenger'

# CarPassenger
class CarPassenger < Car
  include Passenger
  def initialize(number)
    @type = TYPE
    super(number, @type)
  end
end
