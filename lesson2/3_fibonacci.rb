#!/usr/bin/env ruby
# 3_fibonacci.rb
# frozen_string_literal: true

fib1 = 0
fib2 = 1
array = [fib1]

while fib2 < 100
  array << fib2
  fib1, fib2 = fib2, fib1 + fib2
end

p array
