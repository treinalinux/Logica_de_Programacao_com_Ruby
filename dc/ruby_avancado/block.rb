# frozen_string_literal: true

# Block simple
5.times { puts 'Exc the block' }

# Block with params
sum = 0
numbers = [5, 10, 5]
numbers.each { |number| sum += number }
puts sum

# Block with many instructions
foo = { 2 => 3, 4 => 5 }
foo.each do |key, value|
  puts "key = #{key}"
  puts "value = #{value}"
  puts "key * value = #{key * value}"
  puts '---'
end

# Other example with methods
def bar
  # Call the block
  yield
  yield
end

bar { puts 'Exec the block' }

# Other example with params optional

def nav
  # block_given? => check if the block was passed how param
  if block_given?
    # Call the block
    yield
  else
    puts 'No param of type block'
  end
end

nav
nav { puts 'With param of type block' }

# More use &
def param_e(name, &block)
  @name = name
  block.call
end
param_e('Alan') { puts "Hello #{@name}" }

# More use & and given
def param_e_given(numbers, &block)
  if block_given?
    numbers.each do |key, value|
      block.call(key, value)
    end
  end
end

my_numbers = { 2 => 2, 3 => 3, 4 => 4 }

param_e_given(my_numbers) do |key, value|
  puts "#{key} * #{value} = #{key * value}"
  puts "#{key} + #{value} = #{key + value}"
  puts '---'
end
