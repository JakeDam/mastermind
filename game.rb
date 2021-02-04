# frozen_string_literal: true

# Houses information and methods that run the main logic of the game
class Game
  include Display
  def initialize(player, computer)
    @player = player
    @computer = computer
    @turns = 1
    @guess_clone = []
    @code_clone = []
  end

  def add_x_to_array(mode, guess, code, guess_index, code_index = nil)
    guess[guess_index] = 'x'
    if mode == 'exact'
      code[guess_index] = 'x'
    else
      code[code_index] = 'x'
    end
  end

  def find_exact_matches(guess, code, array)
    exact_matches_found = 0
    guess.each_with_index do |guess_num, guess_index|
      next unless guess_num == code[guess_index] && guess_num != 'x'

      exact_matches_found += 1
      add_x_to_array('exact', guess, code, guess_index)
      array << guess_index
    end
    exact_matches_found
  end

  def find_num_matches(guess, code, array)
    num_matches_found = 0
    guess.each_with_index do |guess_num, guess_index|
      code.each.each_with_index do |code_num, code_index|
        next unless guess_num == code_num && array.include?(code_index) == false && guess_num != 'x'

        num_matches_found += 1
        array << code_index
        add_x_to_array('num', guess, code, guess_index, code_index)
      end
    end
    num_matches_found
  end

  def initialize_code(mode)
    if mode == 'player_breaker'
      @computer.generate_code
      code = @computer.comp_code.map(&:to_s)
    else
      code = @player.make_code.split('')
      puts 'Code set:'
      code.each { |n| print "#{color_blocks(n.to_i)} " }
      print "\n"
    end
    code
  end

  def initialize_guess(mode)
    if mode == 'player_breaker'
      puts "Turn #{@turns}: Enter your guess"
      guess = @player.make_guess.split('')
    else
      guess_generator(@turns)
      guess = @computer.next_guess
    end
    guess.each { |n| print "#{color_blocks(n.to_i)} " }
    print "\n"
    guess
  end

  def check_win(guess, code, mode)
    return unless guess == code

    feedback(4, 0)
    if mode == 'player_breaker'
      game_over('win', code, mode)
    else
      game_over('lose', code, mode)
    end
  end

  def end_turns(mode, code)
    if mode == 'player_breaker'
      game_over('lose', code, mode)
    else
      game_over('win', code, mode)
    end
  end

  def feedback_and_comp_solve(exact_matches, num_matches, mode)
    sleep(0.5)
    feedback(exact_matches, num_matches)
    @computer.comp_solve(exact_matches, num_matches) if mode != 'player_breaker'
    sleep(0.5)
  end

  def play(mode)
    code = initialize_code(mode)
    while @turns < 13
      sleep(0.5)
      guess = initialize_guess(mode)
      check_win(guess, code, mode)
      @guess_clone.replace(guess)
      @code_clone.replace(code)
      match_indexes = []
      @code_clone.replace(code)
      exact_matches = find_exact_matches(@guess_clone, @code_clone, match_indexes)
      num_matches = find_num_matches(@guess_clone, @code_clone, match_indexes)
      feedback_and_comp_solve(exact_matches, num_matches, mode)
      @turns += 1
    end
    end_turns(mode, code)
  end
end
