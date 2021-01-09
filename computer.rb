class Computer
  def initialize
    @comp_code = []
  end

  def comp_code
    @comp_code
  end

  def generate_code
    4.times { comp_code << rand(1..6) }
  end
end
