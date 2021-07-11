# frozen_string_literal: true

puts '--Shopping list--'

file = File.open('list.txt')

file.each do |line|
  puts line.to_s
end
