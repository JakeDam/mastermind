require_relative 'display.rb'
require_relative 'player.rb'
require_relative 'computer.rb'
require_relative 'game.rb'
include Display

def play_game
  player = Player.new("Player")
  computer = Computer.new
  game = Game.new(player, computer)
  mode = choose_mode
  player.name = player.get_name

  game.play(mode)
end

play_game





