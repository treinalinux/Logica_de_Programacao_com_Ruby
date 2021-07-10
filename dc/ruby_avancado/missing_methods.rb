# frozen_string_literal: true

# class Fish
class Fish
  def method_missing(method_name)
    puts "Fish don't hove #{method_name} behavior"
  end

  def swim
    puts 'Fish is swimming'
  end
end

fish = Fish.new
fish.swim
fish.walk
