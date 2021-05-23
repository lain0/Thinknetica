#!/usr/bin/env ruby
# 4_vowels.rb
# frozen_string_literal: true

vowels = %w[a e i o u y]
h = {}

vowels.each.map { |letter| h[letter] = letter.bytes[0] - 96 }
p h
