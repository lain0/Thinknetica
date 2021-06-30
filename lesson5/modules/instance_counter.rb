# frozen_string_literal: true

module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
    # base.prepend InstanceMethods
    base.instances = 0
    # base.instance_exec { self.class.instance_method.bind_call.register_instance }
    # puts self.class.
    # puts "#{base.class_eval {p '123'}}"
    # send(self, self.class.instance_method(register_instance()))
    # base.class_eval do
    #   original_method = instance_method(:initialize)
    #   define_method(:initialize) do |*args, &block|
    #     original_method.bind(self).call(*args, &block)
    #     # register_instance
    #     puts 'inside instance_____'
    #   end
    # end
  end

  # def self.extended(base)
  #   base.instance_exec { puts '123' }
  #   base.class_eval do
  #     original_method = instance_method(:initialize)
  #     define_method(:initialize) do |*args, &block|
  #       original_method.bind_call.(self, *args, &block)
  #       # register_instance
  #       puts 'inside extend'
  #     end
  #   end
  # end

  # def self.prepended(base)
  #   base.class_eval do
  #     original_method = instance_method(:initialize)
  #     define_method(:initialize) do |*args, &block|
  #       self.original_method.bind_call(*args, &block)
  #       puts '1234567'
  #       register_instance
  #     end
  #   end
  # end

  module ClassMethods
    attr_reader :instances

    # def instances
    #   self.instances
    # end

    # def instances=(value)
    #   @instances = value
    # end

    protected

    attr_writer :instances
  end

  module InstanceMethods
    private

    def register_instance
      self.class.instances += 1
    end
  end
end
