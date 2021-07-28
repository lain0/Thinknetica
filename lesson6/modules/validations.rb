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
    rescue
      false
    end

    private

    def validate!
      validate_type if @type
      validate_number if @number
      true
    end

    def validate_number
      raise "class #{self.class} initialize variable#{self} Number must not be blank" if @number.size < 1 # nil?
      if @number !~ self.class::NUMBER_FORMAT
        raise "class #{self.class} initialize variable#{self.number} Number must be in format: #{self.class::NUMBER_FORMAT}"
      end
    end

    def validate_type
      unless self.class::TYPES.include?(@type)
        raise "class #{self.class} initialize variable#{self.type} must include #{self.class::TYPES}"      # true
      end
    end
  end
end
