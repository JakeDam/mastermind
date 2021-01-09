class Player
  attr_reader :name
  def initialize(name)
    @name = name
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

end