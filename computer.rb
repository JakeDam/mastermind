class Computer
  attr_accessor :comp_code
  def initialize
    @comp_code = []
  end
 
  #Need to fix generate_code
  def generate_code
    4.times { @comp_code << rand(1..6) }
  end
end

