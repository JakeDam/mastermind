module Display

  def color_blocks(number)
    case number 
    when 1
      "\e[41m   1   \e[0m"
    when 2
      "\e[42m   2   \e[0m"
    when 3
      "\e[43m   3   \e[0m"
    when 4
      "\e[44m   4   \e[0m"
    when 5
      "\e[45m   5   \e[0m"
    when 6
      "\e[46m   6   \e[0m"
    end
  end

  def code_generator
    puts "The computer is generating the code!"
      sleep(0.5)
      print ". "
      sleep(0.5)
      print ". "
      sleep(0.5)
      print ". "
      sleep(0.5)
      print ". "
      sleep(0.5)
      puts " COMPLETE"
      sleep(0.5)
      puts "Code generated! Begin code cracking procedure!"
  end

  def feedback(exact_match, num_match)
    print "Feedback: "
    exact_match.times { print "\e[91m\u25CF\e[0m " }
    num_match.times { print "\e[37m\u25CB\e[0m " }
    print "\n"
  end

end