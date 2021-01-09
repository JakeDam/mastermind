require_relative 'display.rb'
require_relative 'player.rb'
require_relative 'computer.rb'
require_relative 'game.rb'
include Display

test_player = Player.new("Jake")
test_comp = Computer.new
test_game = Game.new(test_player, test_comp)
test_game.play



