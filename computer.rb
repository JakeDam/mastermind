class Computer
  @@comp_code = []
  @@test = "test"

  def comp_code
    @@comp_code
  end

  def generate_code
    4.times { @@comp_code << rand(7) }
  end
end
