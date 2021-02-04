# frozen_string_literal: true

# Handles displaying information and graphics to the terminal
module Display
  def color_blocks(number)
    case number
    when 1
      "\e[41m 1 \e[0m"
    when 2
      "\e[42m 2 \e[0m"
    when 3
      "\e[43m 3 \e[0m"
    when 4
      "\e[44m 4 \e[0m"
    when 5
      "\e[45m 5 \e[0m"
    when 6
      "\e[46m 6 \e[0m"
    end
  end

  def code_generator
    puts 'The computer is generating the code!'
    5.times do
      sleep(0.5)
      print '. '
    end
    puts ' COMPLETE'
    sleep(0.5)
    puts 'Code generated! Begin code cracking procedure!'
  end

  def guess_generator(turn)
    puts "Turn #{turn}: Computer is generating guess!"
    5.times do
      sleep(0.5)
      print '. '
    end
    puts ' Complete'
    sleep(0.5)
    puts 'Computers guess:'
  end

  def feedback(exact_match, num_match)
    puts 'Feedback: '
    print 'No matches!' if (exact_match + num_match).zero?
    exact_match.times { print "\e[41m   \e[0m " }
    num_match.times { print "\e[47m   \e[0m " }
    print "\n"
  end

  def mode_set_message
    puts 'Press 1 to play as the CodeBREAKER'
    puts 'Press 2 to play as the CodeMAKER'
  end

  def choose_mode
    mode_set_message
    while (input = gets.chomp)
      case input
      when '1'
        return 'player_breaker'
      when '2'
        return 'comp_breaker'
      else
        puts 'Please enter 1 or 2'
      end
    end
  end

  def player_win(mode)
    if mode == 'player_breaker'
      puts 'Code sucessfully cracked! Congrats!'
    else
      puts 'Computer failed to guess code! Congrats!'
    end
  end

  def player_lose(code)
    puts 'You failed to crack the code!'
    print 'Code was: '
    code.each { |num| print num }
    print "\n"
  end

  def play_again
    puts 'Play again? (Y/N)'
    while (input = gets.chomp.downcase)
      case input
      when 'y'
        start_new_game
      when 'n'
        puts 'Thanks for playing!'
        exit
      else
        puts 'Please enter Y or N'
      end
    end
  end

  def game_over(outcome, code, mode)
    if outcome == 'win'
      player_win(mode)
    elsif mode == 'player_breaker'
      player_lose(code)
    else
      puts 'The computer cracked your code!'
    end
    play_again
  end
end
