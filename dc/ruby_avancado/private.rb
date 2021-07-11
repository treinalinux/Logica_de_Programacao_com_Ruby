# frozen_string_literal: true

# class Foo
class Foo
  def call_private
    bar
  end

  private

  def bar
    puts 'private method'
  end
end

foo = Foo.new

foo.call_private

# private method `bar' called
# foo.bar
