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

  NUMBER_FORMAT = /\d*/

  def initialize(number, type)
    @number = number
    @type = type
    validate!
  end

  # private

  # def validate!
  #   raise 'Number can\'t be nil' if @number.nil?
  #   raise "class #{self.class} initialize vatiable#{self}Number must be integer" if @number =~ NUMBER_FORMAT
  #   # raise 'tut===><<' if validates_numeric(@number)
  #   true
  # end
end
