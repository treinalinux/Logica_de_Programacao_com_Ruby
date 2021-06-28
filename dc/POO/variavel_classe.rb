# frozen_string_literal: true

# class User
class User
  # Replace class var @@user_count with a class instance var.
  @@user_count = 0

  def add(name)
    puts 'Replace class var @@user_count with a class instance var.'
    puts "User #{name} added"
    @@user_count += 1
    puts @@user_count
  end
end

first_user = User.new
first_user.add('Alan')

second_user = User.new
second_user.add('Carla')
