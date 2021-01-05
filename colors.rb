module Colors 

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
end
