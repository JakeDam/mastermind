# frozen_string_literal: true

# Houses methods for computer to generate code and logic for guessing code
class Computer
  attr_reader :comp_code, :next_guess

  def initialize
    @comp_code = []
    @next_guess = %w[1 1 1 1]
  end

  def generate_code
    4.times { @comp_code << rand(1..6) }
  end

  def comp_guess
    guess = []
    4.times { guess << rand(1..6) }
    guess
  end

  def comp_solve(exact_matches, color_matches)
    feedback = exact_matches + color_matches
    guess = @next_guess
    case feedback
    when 0
      next_num = @next_guess[0].to_i + 1
      guess = guess.map { |_n| n = next_num.to_s }
    when 1
      next_num = @next_guess[1].to_i + 1
      guess = guess.map.with_index { |n, i| i == 0 ? n : n = next_num.to_s }
    when 2
      next_num = @next_guess[2].to_i + 1
      guess = guess.map.with_index { |n, i| [0, 1].include?(i) ? n : n = next_num.to_s }
    when 3
      next_num = @next_guess[3].to_i + 1
      guess[3] = next_num.to_s
    when 4
      case exact_matches
      when 0
        guess = guess.shuffle
      when 1
        guess[1, 3] = guess[1, 3].shuffle
      when 2
        guess[2, 3] = guess[2, 3].shuffle
      end
    end
    @next_guess.replace(guess)
  end
end
