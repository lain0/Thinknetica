# frozen_string_literal: true

# CarCargo
class CarCargo < Car
  def initialize(number)
    @type = TYPES[0]
    super(number, @type)
  end
end
