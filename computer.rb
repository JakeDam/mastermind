# frozen_string_literal: true

# Houses methods for computer to generate code and logic for guessing code
class Computer
  include Display
  attr_reader :comp_code, :next_guess

  def initialize
    @comp_code = []
    @next_guess = %w[1 1 1 1]
    @prev_guesses = []
  end

  def generate_code
    code_generator
    4.times { @comp_code << rand(1..6) }
  end

  def comp_guess
    guess = []
    4.times { guess << rand(1..6) }
    guess
  end

  def feedback0(guess)
    next_num = @next_guess[0].to_i + 1
    guess = guess.map { next_num.to_s }
    @prev_guesses << guess
    guess
  end

  def feedback1(guess)
    next_num = @next_guess[1].to_i + 1
    guess = guess.map.with_index { |n, i| i.zero? ? n : next_num.to_s }
    @prev_guesses << guess
    guess
  end

  def feedback2(guess)
    next_num = @next_guess[2].to_i + 1
    guess = guess.map.with_index { |n, i| [0, 1].include?(i) ? n : next_num.to_s }
    @prev_guesses << guess
    guess
  end

  def feedback3(guess)
    next_num = @next_guess[3].to_i + 1
    guess[3] = next_num.to_s
    @prev_guesses << guess
    guess
  end

  def feedback4(guess)
    while (guess = guess.shuffle)
      break if @prev_guesses.include?(guess) == false
    end
    @prev_guesses << guess
    guess
  end

  def comp_solve(exact_matches, color_matches)
    feedback = (exact_matches + color_matches)
    guess = @next_guess
    case feedback
    when 0
      @next_guess.replace(feedback0(guess))
    when 1
      @next_guess.replace(feedback1(guess))
    when 2
      @next_guess.replace(feedback2(guess))
    when 3
      @next_guess.replace(feedback3(guess))
    when 4
      @next_guess.replace(feedback4(guess))
    end
  end
end
