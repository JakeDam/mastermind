# frozen_string_literal: true

# Houses methods for player to make guesses or make the code
class Player
  def make_guess
    while (guess = gets.chomp)
      if guess.length != 4
        puts 'Enter a 4 digit number'
      elsif guess.split('').any? { |n| (1..6).include?(n.to_i) == false }
        puts 'Only enter digits 1-6'
      else
        break
      end
    end
    guess
  end

  def make_code
    puts 'Enter a 4 digit code using numbers 1-6 for the computer to crack!'
    while (player_code = gets.chomp)
      if player_code.length != 4
        puts 'Enter a 4 digit number'
      elsif player_code.split('').any? { |n| (1..6).include?(n.to_i) == false }
        puts 'Only enter digits 1-6'
      else
        return player_code
      end
    end
  end
end
