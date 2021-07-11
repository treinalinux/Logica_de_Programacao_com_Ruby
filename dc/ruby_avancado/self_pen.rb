# frozen_string_literal: true

# class Pen
class Pen
  attr_accessor :color

  def pen_color
    puts "The color ir #{self.color}"
  end
end

pen_blue = Pen.new
pen_blue.color = 'blue'
pen_blue.pen_color

pen_black = Pen.new
pen_black.color = 'black'
pen_black.pen_color

# ----
class Foo
  def self.bar
    puts self
  end
end

Foo.bar
