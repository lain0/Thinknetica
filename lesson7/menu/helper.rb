# frozen_string_literal: true

module Helper
  module Array
    def iterator
      self.each_with_index { |v, i| puts "press #{i} to select #{v} #{v.class}" }
    end

    # a_to_h  - for usage in menu call
    def a_to_h
      self.map.with_index.to_h.invert
    end

    def intermitiate
      self[1...-1]
    end
  end

  # module Kernel
  #   def puts(object)
  #     system('clear')
  #     super(object)
  #   end
  # end
end
