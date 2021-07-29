# frozen_string_literal: true

module Validations
  def self.included(base)
    base.include InstanceMethods
  end

  module InstanceMethods
    def valid?
      validate!
      true
    rescue RuntimeError
      false
    # rescue
    #   false
    end

    private

    def validate!
      validate_type if @type
      validate_number if @number
      validate_name if @name
      true
    end

    def validate_number
      raise "class #{self.class} initialize variable#{self} Number must not be blank" if @number.size < 1
      if @number !~ self.class::NUMBER_FORMAT
        raise "class #{self.class} initialize variable#{self.number} Number must be in format: #{self.class::NUMBER_FORMAT}"
      end
    end

    def validate_type
      unless self.class::TYPES.include?(@type)
        raise "class #{self.class} initialize variable#{self.type} must include #{self.class::TYPES}"
      end
    end

    def validate_name
      raise "class #{self.class} initialize variable#{self} Name must not be blank" if @name.size < 1
      if @name !~ self.class::NAME_FORMAT
        raise "class #{self.class} @name=#{self.name} Name's length must be from 1 to 10 Chars"
      end
    end
  end
end
