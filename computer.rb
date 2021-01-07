class Computer
  @@comp_code = []
  @@test = "test"

  def comp_code
    @@comp_code
  end

  def generate_code
    4.times { @@comp_code << rand(1..6) }
  end

  def reset_code
    @@comp_code = @@comp_code.clear
  end
end
