# frozen_string_literal: true

require_relative 'passenger'

# CarPassenger
class CarPassenger < Car
  attr_reader :type
  include Passenger
  def initialize(number)
    @type = TYPE
    super(number, @type)
  end
end
