# frozen_string_literal: true

require_relative 'passenger'

# TrainPassenger
class TrainPassenger < Train
  include Passenger
  def initialize(number)
    @type = TYPE
    super(number, @type)
  end
end
