require_relative 'model/animal.rb'
require_relative 'dog.rb'

animal = Animal.new

puts animal.jump

puts animal.sleep

rex = Dog.new
puts "rex, lati.: #{rex.latir} ..."
puts "rex, pula.: #{rex.sleep} ..."
puts "rex, dorme: #{rex.jump} ..."
