# frozen_string_literal: true

# CarPassenger
class CarPassenger < Car
  attr_reader :seats

  def initialize(number, seats)
    @type = TYPES[1]
    super(number, @type)
    @seats = seats.to_i
    @seats_occupied = 0
  end

  def take_seat
    @seats_occupied += 1
  end

  def seats_free
    @seats - @seats_occupied
  end

  def seats_occupied
    @seats_occupied
  end
end
