# frozen_string_literal: true

require_relative 'cargo'

# CarCargo
class CarCargo < Car
  attr_reader :type
  include Cargo
  def initialize(number)
    @type = TYPE
    super(number, @type)
  end
end
