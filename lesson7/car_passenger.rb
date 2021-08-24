# frozen_string_literal: true

# CarPassenger
class CarPassenger < Car
  attr_reader :seats, :seats_occupied

  def initialize(number, seats)
    @type = TYPES[1]
    super(number, @type)
    @seats = seats.to_i
    @seats_occupied = 0
  end

  def take_seat
    @seats_occupied += yield.to_i if block_given?
    @seats_occupied += 1
  end

  def seats_free
    @seats - @seats_occupied
  end
end
