require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

store_name = gets.chomp
one = Store.create(name: store_name)
puts one.errors.messages
two = Store.create(name: store_name, annual_revenue: 0)
puts two.errors.messages
Store.create(name: store_name, annual_revenue: 0, mens_apparel:true)
