# frozen_string_literal: true

require_relative 'modules/manufacturer_name'
require_relative 'modules/types'
require_relative 'modules/validations'

# Car
class Car
  include ManufacturerName
  include Validations
  include Types
  attr_reader :type

  NUMBER_FORMAT = /\d*/.freeze

  def initialize(number, type)
    @number = number
    @type = type
    validate!
  end
end
