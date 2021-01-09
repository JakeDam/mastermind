class Game
  include Display
  def initialize(player, computer)
    @player = player
    @computer = computer
    @turns = 12
  end

  

  def play
    code_generator
    code = @computer.generate_code.to_s.split("")
    while @turns > 0 do
      puts "Turn #{@turns}: #{@player.name}, enter your guess"
      guess = @player.make_guess.split("")
      guess.each { |n| print color_blocks(n.to_i) }
      print "\n"
      exact_matches = 0
      num_match = 0
      index_matches = []
      guess.each_with_index do |guess_num, guess_index|
        if guess[guess_index] == code[guess_index]
          exact_matches += 1
        #TODO determine way to find if number appears in array at not extact location 
        #Break off num_match and exact_matches into their own methods
        elsif code.include?(guess_num)

      end
      feedback(exact_matches, 0)
      @turns -= 1
    end
  end
end