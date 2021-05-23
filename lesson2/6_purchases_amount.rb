#!/usr/bin/env ruby
# 6_purchases_amount.rb
# frozen_string_literal: true

product_name = ''
purchases = {}
sum = 0
loop do
  puts 'Input Product.name'
  product_name = gets.chomp.strip
  break if product_name == 'stop'

  puts 'Input Product.quantity'
  quantity = gets.to_i
  puts 'Input Product.price'
  price = gets.to_f
  purchases[product_name] = { price: price, quantity: quantity }
end

p purchases
purchases.map { |k, v| p "Сумма за #{k} = #{v[:price] * v[:quantity]}" }
purchases.map { |_, v| sum += v[:price] * v[:quantity] }
p "Итоговая стоимость всех товаров := #{sum}"
