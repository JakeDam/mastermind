require_relative 'colors.rb'
require_relative 'interface.rb'
require_relative 'game.rb'
require_relative 'computer.rb'
require_relative 'player.rb'
include Interface
include Colors 

test_comp = Computer.new
test_player = Player.new("Jake")
test_game = Game.new(test_comp, test_player)
test_game.code_break




