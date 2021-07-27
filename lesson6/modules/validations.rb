module Validations
  def self.included(base)
    base.include InstanceMethods
  end

  module InstanceMethods
    # def validates_numeric(atts, opts=OPTS)
    #   validatable_attributes_for_type(:numeric, atts, opts) do |a,v,m|
    #     begin
    #       Kernel.Float(v.to_s)
    #       nil
    #     rescue
    #       validation_error_message(m)
    #     end
    #   end
    # end

    def valid?
      puts 'before validate!'
      validate!
      p 'after validate in valid?   ===== ok'
      true
    # rescue StandardError
    #   false
    # rescue RuntimeError
    #   false
    # rescue Error
    #   false
    rescue
      false
    end

    # private

    def validate!
      validate_type if @type
      validate_number if @number
      true
    end

    def validate_number
      p "valiate_number #{self.number} @number=#{@number}"
      raise "class #{self.class} initialize variable#{self} Number must not be blank" if @number.size < 1 # nil?
      if @number !~ self.class::NUMBER_FORMAT
        raise "class #{self.class} initialize variable#{self.number} Number must be in format: #{self.class::NUMBER_FORMAT}"
      end
      # true
    end

    def validate_type
      p "valiate_type #{self.type} @type=#{@type}"
      # raise "class #{self.class} initialize variable#{self} has nil type" if @type.nil?
      # raise "class #{self.class} initialize variable#{self.type} must include #{self.class::TYPES}" unless @type =~ self.class::TYPES # || @type =~ self.class.superclass::TYPES
      raise "class #{self.class} initialize variable#{self.type} must include #{self.class::TYPES}" unless self.class::TYPES.include?(@type) # || @type =~ self.class.superclass::TYPES
      # true
    end
  end
end
