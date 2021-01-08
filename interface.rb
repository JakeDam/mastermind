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
    while guess = gets.chomp.to_i
      if guess.is_a?(Integer) == false
        puts "Please enter only digits."
      elsif guess.digits.count != 4
        puts "Enter a 4 digit number."
      elsif guess.to_s.split("").all? { |n| (1..6).include?(n.to_i) } == false
        puts "Enter only digits from 1-6." 
      else
        break
      end
    end
    return guess
  end

end

  