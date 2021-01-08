class Game
  def initialize(comp, player)
    @comp = comp
    @player = player
    @code = comp.generate_code
    @turns = 12
  end

  include Interface

  def code_break
    correct_num = 0
    correct_num_and_pos = 0
    guess = get_guess(@player.name).to_s.split("")
    guess.each_with_index do | guess_digit, guess_index |
      if guess[guess_index] == @code[guess_index]
        correct_num_and_pos += 1
      end
    end
    puts @code
    puts correct_num_and_pos
  end

end