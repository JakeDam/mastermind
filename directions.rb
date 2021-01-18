module Directions
  def directions 
    <<~HEREDOC

    WELCOME TO MASTERMIND!

    --BACKGROUND--
    Mastermind is codebreaking game for two players. One player sets the code and the other tries to break it.

    --HOW TO PLAY--
    To play the game, the codemaker chooses a four digit code from the following six numbers:
    #{color_blocks(1)} #{color_blocks(2)} #{color_blocks(3)} #{color_blocks(4)} #{color_blocks(5)} #{color_blocks(6)} 

    The codebreaker will then have 12 chances to correctly guess the code and win the game. 

    After each guess, the codebreaker will be provided with feedback to tell them how much of their guess was correct

    A red block \e[41m   \e[0m indicates that the guess has a number that is correct and also in the correct position.

    A white block \e[47m   \e[0m indicates that the guess has a numer that is correct but in the wrong position. 
    
    HEREDOC
  end
end