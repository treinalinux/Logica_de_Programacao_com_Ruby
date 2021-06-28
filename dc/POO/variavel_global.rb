
# class Bar
class Bar
  def foo
    # Do not introduce global variables.
    puts 'Do not introduce global variables!!!'
    $global = 0
    puts $global
  end
end

# class Baz
class Baz
  def qux
    $global += 1
    puts $global
  end
end

bar = Bar.new
baz = Baz.new

bar.foo
baz.qux
baz.qux
