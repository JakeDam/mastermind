# frozen_string_literal: true

require_relative 'display'
require_relative 'directions'
require_relative 'player'
require_relative 'computer'
require_relative 'game'

# Main game class ties together all other classes to start game
class MainGame
  include Display
  include Directions
  def play_game
    player = Player.new
    computer = Computer.new
    game = Game.new(player, computer)
    mode = choose_mode

    game.play(mode)
  end
end

def start_new_game
  new_game = MainGame.new
  puts new_game.directions
  new_game.play_game
end

start_new_game
