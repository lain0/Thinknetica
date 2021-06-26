# frozen_string_literal: true

require_relative 'modules/instance_counter'
# Car
class Car
  include InstanceCounter
  # prepend InstanceCounter
  attr_reader :type

  def initialize(number, type)
    register_instance
    @number = number
    @type = type
  end
end
