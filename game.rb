class Game(comp, player)
  def initialize
    @comp = comp
    @player = player
  end

  include Interface

  def code_break
    player_guess = get_guess(player.name)
    puts player_guess
  end


end