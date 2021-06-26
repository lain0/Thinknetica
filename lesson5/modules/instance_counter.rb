# frozen_string_literal: true

module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
    base.instances = 0
    # base.class_eval do
    #   original_method = instance_method(:initialize)
    #   define_method(:initialize) do |*args, &block|
    #     original_method.bind_call.(self,*args, &block)
    #     register_instance
    #   end
    # end

  end

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
    #   @instances
    #   # self.instances
    # end

    # def instances=(value)
    #   @instances = value
    # end

    # def initialize
    #   puts 'it works from ClassMethods'
    #   register_instance
    # end

    # protected

    attr_writer :instances
  end

  module InstanceMethods
    protected

    # def initialize
    #   puts 'it works from InstanceMethods'
    #   register_instance
    # end
    def register_instance
      self.class.instances += 1
    end
  end
end
