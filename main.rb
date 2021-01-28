require_relative 'display'
require_relative 'player'
require_relative 'computer'
require_relative 'game'
require_relative 'directions'

def play_game
  player = Player.new
  computer = Computer.new
  game = Game.new(player, computer)
  mode = choose_mode

  game.play(mode)
end

puts directions
play_game
