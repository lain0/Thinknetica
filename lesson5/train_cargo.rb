# frozen_string_literal: true

require_relative 'cargo'

# TrainCargo
class TrainCargo < Train
  include Cargo
  def initialize(number)
    @type = TYPE
    super(number, @type)
  end
end
