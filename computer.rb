class Computer
  attr_reader :comp_code
  
  def initialize
    @comp_code = []
    @previous_guess = []
  end

  def generate_code
    4.times { @comp_code << rand(1..6) }
  end
  
  def comp_guess
    guess = []
    4.times { guess << rand(1..6) }
    guess
  end

  def update_previous_guess(guess)
    @previous_guess.replace(guess)
  end

  def comp_solve(exact_matches, color_matches)

  
end
