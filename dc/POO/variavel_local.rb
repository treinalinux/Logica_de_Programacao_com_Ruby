# frozen_string_literal: true

# class Bar
class Bar
  def foo
    # Can be defined as local or local
    local = 'location is to access only within this method'
    puts local
  end

  def example
    # error ...  undefined local variable or method `local
    local
  end
end

bar = Bar.new
bar.foo

# Error: example': undefined local variable or method `local'
bar.example
