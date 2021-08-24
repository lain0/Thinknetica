# frozen_string_literal: true

# CarCargo
class CarCargo < Car
  attr_reader :volume, :volume_occupied

  def initialize(number, volume)
    @type = TYPES[0]
    super(number, @type)
    @volume = volume.to_i
    @volume_occupied = 0
  end

  def take_volume
    @volume_occupied += yield.to_i if block_given?
    @volume_occupied += 1
  end

  def volume_free
    @volume - @volume_occupied
  end
end
