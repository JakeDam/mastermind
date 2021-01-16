class Computer
  attr_reader :comp_code 
  attr_reader :next_guess
  
  def initialize
    @comp_code = []
    @next_guess = ["1", "1", "1", "1"]
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
    puts "CALLED!"
    feedback = exact_matches + color_matches 
    case feedback
    when 0
      next_num = @next_guess[0].to_i + 1
      p next_num
      @next_guess.map! { |n| n = next_num.to_s }
    when 1
      next_num = @next_guess[0].to_i + 1
      p next_num
      @next_guess[1..-1].map! { |n| n = next_num.to_s }
      p @next_guess
    when 2
      next_num = @next_guess[1].to_i + 1
      @next_guess[2..-1].map! { |n| n = next_num.to_s }
    when 3
      next_num = @next_guess[2].to_i + 1
      @next_guess[3] = next_num
    when 4
      @next_guess.shuffle!
    end
  end
end
