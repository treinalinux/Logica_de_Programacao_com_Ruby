# frozen_string_literal: true

# example default
first_lambda = lambda { puts 'my first lambda' }
first_lambda.call

# example of lambda with syntax sugar
second_lambda = -> { puts 'my second lambda' }
second_lambda.call

# example with param
third_lambda = ->(names) { names.each { |name| puts name } }
names = %w[Alan Carla Claudia]
third_lambda.call(names)

# example with many lines
my_lambda = lambda do |numbers|
  index = 0
  puts 'Número atual + Póximo número'
  numbers.each do |number|
    return if numbers[index] == numbers.last

    puts "(#{numbers[index]}) + (#{numbers[index + 1]})"
    puts numbers[index] + numbers[index + 1]
    index += 1
  end
end

numbers = [1, 2, 3, 4]

my_lambda.call(numbers)

def foo(first_param_lambda, second_param_lambda)
  first_param_lambda.call
  second_param_lambda.call
end

first_param_lambda = -> { puts 'first param lambda' }
second_param_lambda = -> { puts 'second param lambda' }

foo(first_param_lambda, second_param_lambda)
