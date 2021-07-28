# frozen_string_literal: true

# CarPassenger
class CarPassenger < Car
  def initialize(number)
    @type = TYPES[1]
    super(number, @type)
  end
end
