# frozen_string_literal: true

# my class Computer
class Computer
  # behaviors are methods
  def power_on
    'Ligando...'
  end

  def power_off
    'Desligando...'
  end
end

# initialize object
computer = Computer.new

puts computer.power_on
puts computer.power_off
