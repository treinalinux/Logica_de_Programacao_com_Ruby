# frozen_string_literal: true

# class Instrument
class Instrument
  def writer
    puts 'writing'
  end
end

# class Pencil
class Pencil < Instrument
  def writer
    puts 'writing with pencil'
  end
end

# class Pen
class Pen < Instrument
  def writer
    puts 'writing with pen'
  end
end

# class Typewriter with super
class Typewriter < Instrument
  def writer
    super
    puts 'writing with typewriter'
  end
end

# class Keyboard
class Keyboard < Instrument
end

puts '----- typewriter ---- '
typewriter = Typewriter.new
typewriter.writer

puts '----- keyboard ---- '
keyboard = Keyboard.new
keyboard.writer
