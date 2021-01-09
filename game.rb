class Game
  include Display
  def initialize(player, computer)
    @player = player
    @computer = computer
    @turns = 12
  end

  

  def play
    code_generator
    code = @computer.generate_code
    #TODO
    while @turns > 0 do
      puts "Turn:#{@turns} #{player.name}, enter your guess"
      
    end

  end
end