# frozen_string_literal: true

module ManufacturerName
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end
  module ClassMethods
    attr_accessor :manufacturer_name
  end
end
