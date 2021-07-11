# frozen_string_literal: true

# class Foo
class Foo
  attr_accessor :name

  def call_protected(instance)
    instance.bar
  end

  protected

  def bar
    puts name
  end
end

instance_one = Foo.new
instance_one.name = 'Alan'

instance_two = Foo.new
instance_two.name = 'Carla'

instance_one.call_protected(instance_one)

instance_one.call_protected(instance_two)

