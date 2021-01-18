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

  def game_over(outcome, code, mode)
    if outcome == "win"
      if mode == "player_breaker"
        puts "Code sucessfully cracked! Congrats!"
      else  
        puts "Computer failed to guess code! Congrats!"
      end
    else
      if mode == "player_breaker"
        puts "You failed to crack the code!"
        print "Code was: " 
        code.each { |num| print num }
        print "\n"
      else  
        puts "The computer cracked your code!"
      end
    end
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

  def set_code(mode)
    if mode == "player_breaker"
      code_generator
      @computer.generate_code
      code = @computer.comp_code.map { |num| num.to_s }
    else  
      code = @player.make_code.split("")
      puts "Code set:"
      code.each { |n| print color_blocks(n.to_i) + " " }
      print "\n"
    end
  code
  end

  def set_guess(mode)
    if mode == "player_breaker"
      puts "Turn #{@turns}: #{@player.name}, enter your guess"
      guess = @player.make_guess.split("")
      guess.each { |n| print color_blocks(n.to_i) + " " }
      print "\n"
    else  
      guess_generator(@turns)
      guess = @computer.next_guess
      sleep(0.5)
      guess.each { |n| print color_blocks(n.to_i) + " " }
      print "\n"
    end
  guess
  end

  def check_win(guess, code, mode)
    if guess == code
      feedback(4,0)
      if mode == "player_breaker"
        game_over("win", code, mode)
      else
        game_over("lose", code, mode)
      end
    end
  end

  def end_turns(mode, code)
    if mode == "player_breaker"
      game_over("lose", code, mode)
    else
      game_over("win", code, mode)
    end
  end


  def play(mode)
    code = set_code(mode)
    while @turns < 13 do
      sleep(0.5)
      guess = set_guess(mode)
      check_win(guess, code, mode)
      exact_matches, num_matches, guess_clone, code_clone, match_indexes = 0, 0, [], [], []
      guess_clone.replace(guess)
      code_clone.replace(code)
      exact_matches += find_exact_matches(guess_clone, code_clone, match_indexes)
      num_matches += find_num_matches(guess_clone, code_clone, match_indexes)
      sleep(0.5)
      feedback(exact_matches, num_matches)
      if mode != "player_breaker"
        @computer.comp_solve(exact_matches, num_matches)
      end
      sleep(0.5)
      @turns += 1
    end
    end_turns(mode, code)
  end
end