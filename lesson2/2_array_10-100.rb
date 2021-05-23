#!/usr/bin/env ruby
# 2_array_10-100.rb
# frozen_string_literal: true

# array = []
# array.push(*(10..100).step(5).map { |v| v })
# (10..100).step(5).map { |v| array.push(v) }
p 10.step(100, 5).to_a
