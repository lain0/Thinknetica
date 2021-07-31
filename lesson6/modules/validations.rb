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
      raise "class #{self.class} Number #{self} must not be blank" if @number.empty?
      raise "class #{self.class} Number #{number} must be in format: #{self.class::NUMBER_FORMAT}" unless self.class::NUMBER_FORMAT.match?(@number)
    end

    def validate_type
      raise "class #{self.class} type #{type} must be one of #{self.class::TYPES}" unless self.class::TYPES.include?(@type)
    end

    def validate_name
      raise "class #{self.class} initialize variable#{self} Name must not be blank" if @name.empty?
      raise "class #{self.class} name #{name} length must be from 1 to 10 Chars" unless self.class::NAME_FORMAT.match?(@name)
    end
  end
end
