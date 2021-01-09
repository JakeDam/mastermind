class Computer
  attr_reader :comp_code
  
  def initialize
    @comp_code = []
  end

  def generate_code
    4.times { @comp_code << rand(1..6) }
  end
end
