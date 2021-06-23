# frozen_string_literal: true

# Car
class Car
  attr_reader :type

  def initialize(number, type)
    @number = number
    @type = type
  end
end
