# frozen_string_literal: true

# CarPassenger
class CarPassenger < Car
  def initialize(number, seats_total_number)
    @type = TYPES[1]
    super(number, @type)
    @seats_total_number = seats_total_number
    @seats_occupied_number = 0
  end

  def take_seat

  end
end
