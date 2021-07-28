# frozen_string_literal: true

# TrainPassenger
class TrainPassenger < Train
  def initialize(number)
    @type = TYPES[1]
    super(number, @type)
  end
end
