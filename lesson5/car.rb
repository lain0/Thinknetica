# frozen_string_literal: true

require_relative 'modules/instance_counter'
require_relative 'modules/manufacturer_name'

# Car
class Car
  attr_reader :type
  include InstanceCounter
  # include ManufacturerName
  def initialize(number, type)
    super()
    # register_instance
    @number = number
    @type = type
  end

end
