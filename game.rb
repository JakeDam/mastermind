class Game
  def initialize(comp, player)
    @comp = comp
    @player = player
    @code = comp.generate_code
  end

  include Interface

  def code_break
    player_guess = get_guess(@player.name)
    puts player_guess
  end

end