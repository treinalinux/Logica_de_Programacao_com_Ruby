# frozen_string_literal: true

# module Football
module Football
  class Player
    def self.info
      puts 'The player soccer need a good physical conditioning'
    end
  end
end

# module VideoGame
module VideoGame
  class Player
    def self.info
      puts 'The player soccer need motor coordination'
    end
  end
end

Football::Player.info
VideoGame::Player.info
