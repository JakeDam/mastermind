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
      if guess_num == code[guess_index] && guess_num != "x"
        exact_matches_found += 1
        guess[guess_index], code[guess_index] = "x", "x"
        array << guess_index
      end
    end
    exact_matches_found
  end

  def find_num_matches(guess, code, array)
    num_matches_found = 0
    guess.each_with_index do |guess_num, guess_index|
      code.each.each_with_index do |code_num, code_index|
        if guess_num == code_num && array.include?(code_index) == false && guess_num != "x"
          num_matches_found += 1
          array << code_index
          guess[guess_index]= "x"
          code[code_index] = "x"
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
      while input = gets.chomp.downcase
        if input == "y"
          play_game
        elsif input == "n"
          puts "Thanks for playing!"
          exit
        else
          puts "Please enter Y or N"
        end
      end
    else
      puts "You failed to crack the code!"
      print "Code was: " 
      code.each { |num| print num }
      print "\n"
      puts "Play again? (Y/N)"
      while input = gets.chomp.downcase
        if input == "y"
          play_game
        elsif input == "n"
          puts "Thanks for playing!"
          exit
        else
          puts "Please enter Y or N"
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
      guess.each { |n| print color_blocks(n.to_i) + " " }
      print "\n"
      if guess == code
        feedback(4,0)
        game_over("win", code)
      end
      exact_matches, num_matches = 0, 0
      guess_clone, code_clone = [], []
      guess_clone.replace(guess)
      code_clone.replace(code)
      match_indexes = []
      exact_matches += find_exact_matches(guess_clone, code_clone, match_indexes)
      num_matches += find_num_matches(guess_clone, code_clone, match_indexes)
      feedback(exact_matches, num_matches)
      @turns += 1
    end
    game_over("lose", code)
  end
end