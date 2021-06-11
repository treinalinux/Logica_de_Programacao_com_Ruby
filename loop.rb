# frozen_string_literal: true

# executa 3x usando um bloco
3.times { |i| puts "times 1: #{i}" }

# executa 3x usando um bloco
3.times do |i|
  puts "times 2: #{i}"
end

# range com each
(1..4).each { |i| puts "each  1: #{i}" }

# array com each
[9, 8, 7, 6].each { |i| puts "each  2: #{i}" }

# while
contador = 1

while contador <= 5
  puts "while 1: #{contador}"
  contador += 1
end
