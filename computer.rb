class Computer
  attr_reader :comp_code
  
  def initialize
    @comp_code = []
    @next_guess = []
  end

  def generate_code
    4.times { @comp_code << rand(1..6) }
  end
  
  def comp_guess
    guess = []
    4.times { guess << rand(1..6) }
    guess
  end

  def comp_solve(exact_matches, color_matches, prev_guess)
    nums = ["1", "2", "3", "4", "5", "6"]
    feedback = exact_matches + color_matches
    case feedback 
    when 0
      #TODO
    when 1
      #TODO
    when 2
      #TODO
    when 3
      #TODO
    when 4
      #TODO
    end
  end
end
