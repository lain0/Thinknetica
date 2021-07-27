# frozen_string_literal: true

# require_relative 'cargo'

# CarCargo
class CarCargo < Car
  # include Cargo
  def initialize(number)
    @type = TYPES[1]
    super(number, @type)
  end
end
