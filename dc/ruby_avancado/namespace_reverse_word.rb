# frozen_string_literal: true

# module ReserveWorld
module ReserveWorld
  def self.puts(text)
    # Kernel::puts text.reverse.to_s
    Kernel.puts text.reverse.to_s
  end
end

# ReserveWorld::puts 'The result is'
ReserveWorld.puts 'The result is'
