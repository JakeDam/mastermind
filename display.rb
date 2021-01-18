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
    puts "The computer is generating the code!"
      5.times do
        sleep(0.5)
        print ". "
      end
      puts " COMPLETE"
      sleep(0.5)
      puts "Code generated! Begin code cracking procedure!"
  end

  def guess_generator(turn)
    puts "Turn #{turn}: Computer is generating guess!"
      5.times do
        sleep(0.5)
        print ". "
      end
    puts " Complete"
    sleep(0.5)
    puts "Computers guess:"
  end

  def feedback(exact_match, num_match)
    puts "Feedback: "
    if exact_match + num_match == 0
      print "No matches!"
    end
    exact_match.times { print "\e[41m   \e[0m " }
    num_match.times { print "\e[47m   \e[0m " }
    print "\n"
  end

  def choose_mode
    puts "Press 1 to play as the CodeBREAKER"
    puts "Press 2 to play as the CodeMAKER"
    while input = gets.chomp
      if input == "1"
        return "player_breaker"
      elsif input == "2"
        return "comp_breaker"
      else
        puts "Please enter 1 or 2"
      end
    end
  end


end