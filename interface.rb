module Interface

  def greeting
    puts "Welcome to Mastermind!"
  end

  def get_name
    puts "What is your name?"
    gets.chomp
  end

  def generating_code
    puts "The computer is generating the code!"
  end

  def get_guess(player)
    puts "#{player}, enter your attempt to crack the code: "
    while guess = gets.chomp
      if guess.is_a? Fixnum == false
        puts "Please enter only digits."
      elsif guess.digits.count != 4
        puts "Enter a 4 digit number."
      else  
        break
      end
    end
  end

end

  