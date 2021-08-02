# frozen_string_literal: true

# TrainCargo
class TrainCargo < Train
  def initialize(number)
    @type = TYPES[0]
    super(number, @type)
  end
end
