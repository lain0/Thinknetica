# frozen_string_literal: true

require_relative 'modules/manufacturer_name'

# Car
class Car
  include ManufacturerName
  attr_reader :type

  def initialize(number, type)
    @number = number
    @type = type
  end
end
