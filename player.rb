class Player
  attr_accessor :name
  def initialize(name)
    @name = name
  end

  def get_name
    puts "Please enter your name: "
    name = gets.chomp
  end

  def make_guess
    while guess = gets.chomp
      if guess.length != 4
        puts "Enter a 4 digit number"
      elsif guess.split("").any? { |n| (1..6).include?(n.to_i) == false } 
        puts "Only enter digits 1-6"
      else  
        break
      end
    end
    guess
  end

  def make_code
    puts "#{@name}, enter a 4 digit code using numbers 1-6 for the computer to crack!"
    while player_code = gets.chomp
      if player_code.length != 4
        puts "Enter a 4 digit number"
      elsif player_code.split("").any? { |n| (1..6).include?(n.to_i) == false } 
        puts "Only enter digits 1-6"
      else  
        break
      end
    end
    player_code
  end

end