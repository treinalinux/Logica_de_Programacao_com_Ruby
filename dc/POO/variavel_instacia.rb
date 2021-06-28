# frozen_string_literal: true

# class User
class User
  def add(name)
    @name = name
    puts "\nUser #{@name} added"
    hello
  end

  def hello
    puts "Welcome, #{@name}!"
  end
end

first_user = User.new
first_user.add('Alan')

second_user = User.new
second_user.add('Carla')

# first_user.hello
# second_user.hello
