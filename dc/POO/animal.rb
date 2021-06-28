# frozen_string_literal: true

# class Animal
class Animal
  def jump
    'Tiong tóim'
  end

  def sleep
    'ZzZzzZzzZ'
  end
end

# clss Dog <<< of Animal
class Dog < Animal
  def latir
    'Au au'
  end
end

rex = Dog.new
puts "rex, lati.: #{rex.latir} ..."
puts "rex, pula.: #{rex.sleep} ..."
puts "rex, dorme: #{rex.jump} ..."
