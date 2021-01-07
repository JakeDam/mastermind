require_relative 'colors.rb'
require_relative 'interface.rb'
require_relative 'game.rb'
require_relative 'computer.rb'
require_relative 'player.rb'
include Interface
include Colors 

test = Computer.new
test.generate_code
puts test.comp_code



