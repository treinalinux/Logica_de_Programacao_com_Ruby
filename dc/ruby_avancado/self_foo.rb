# frozen_string_literal: true

# class Foo
class Foo
  attr_accessor :teste

  def bar
    puts self
  end
end

foo = Foo.new
puts foo
foo.bar
