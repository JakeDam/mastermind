class Game
  include Display
  def initialize(player, computer)
    @player = player
    @computer = computer
    @turns = 1
  end

  def find_exact_matches(guess, code, array)
    exact_matches_found = 0
    guess.each_with_index do |guess_num, guess_index|
      if guess_num == code[guess_index]
        exact_matches_found += 1
        array << guess_index
      end
    end
    exact_matches_found
  end

  def find_num_matches(guess, code, array)
    num_matches_found = 0
    guess.each do |guess_num|
      code.each.each_with_index do |code_num, code_index|
        if guess_num == code_num && array.include?(code_index) == false
          num_matches_found += 1
          array << code_index
          break
        end
      end
    end
    num_matches_found
  end

  def game_over(outcome, code)
    if outcome == "win"
      puts "Code sucessfully cracked! Congrats!"
      puts "Play again? (Y/N)"
      while input == gets.chomp.downcase
        case input
        when "y"
          play_game
        when "n"
          puts "Thanks for playing!"
          exit
        end
      end
    else
      puts "You failed to crack the code!"
      puts "Code was: #{code}"
      while input == gets.chomp.downcase
        case input
        when "y"
          play_game
        when "n"
          puts "Thanks for playing!"
          exit
        end
      end
    end
  end

  def play
    code_generator
    @computer.generate_code
    code = @computer.comp_code.map { |num| num.to_s }
    while @turns < 13 do
      puts "Turn #{@turns}: #{@player.name}, enter your guess"
      guess = @player.make_guess.split("")
      guess.each { |n| print color_blocks(n.to_i) }
      print "\n"
      if guess == code
        feedback(4,0)
        game_over("win", code)
      end
      exact_matches, num_matches = 0, 0
      match_indexes = []
      exact_matches += find_exact_matches(guess, code, match_indexes)
      num_matches += find_num_matches(guess, code, match_indexes)
      feedback(exact_matches, num_matches)
      @turns += 1
    end
    game_over("lose", code)
  end
end