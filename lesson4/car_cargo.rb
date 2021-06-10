# frozen_string_literal: true

require_relative 'cargo'

# CarCargo
class CarCargo < Car
  include Cargo
  def initialize(number)
    @type = TYPE
    super(number, @type)
  end
end
