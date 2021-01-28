# frozen_string_literal: true

# rubocop:disable Metrics/AbcSize

# Displays directions for how to play the game
module Directions
  def directions
    <<~HEREDOC
      WELCOME TO MASTERMIND!

      --BACKGROUND--
      Mastermind is codebreaking game for two players. One player sets the code and the other tries to break it.

      --HOW TO PLAY--
      To play the game, the codemaker chooses a four digit code from the following six numbers:
      #{color_blocks(1)} #{color_blocks(2)} #{color_blocks(3)} #{color_blocks(4)} #{color_blocks(5)} #{color_blocks(6)}#{' '}

      The codebreaker will then have 12 chances to correctly guess the code and win the game.#{' '}

      After each guess, the codebreaker will be provided with feedback to tell them how much of their guess was correct.

      A red block \e[41m   \e[0m indicates that the guess has a number that is correct and also in the correct position.

      A white block \e[47m   \e[0m indicates that the guess has a number that is correct but in the wrong position.#{' '}

      EXAMPLE:
      Code: #{color_blocks(2)} #{color_blocks(6)} #{color_blocks(4)} #{color_blocks(5)}

      Guess: #{color_blocks(1)} #{color_blocks(6)} #{color_blocks(2)} #{color_blocks(2)}

<<<<<<< HEAD
      Feedback: \e[41m   \e[0m \e[47m   \e[0m
=======
    A white block \e[47m   \e[0m indicates that the guess has a number that is correct but in the wrong position. 
    
    EXAMPLE:
    Code: #{color_blocks(2)} #{color_blocks(6)} #{color_blocks(4)} #{color_blocks(5)}
>>>>>>> da0a257346be0006d83413b22233864dbf07a1aa

      This example yields feedback of one red block and one white block.
      The red block is given becuase the guess matches the code exactly at the second position with the number #{color_blocks(6)}.
      The white block is given because the guess has a #{color_blocks(2)} at the third position and the code has a #{color_blocks(2)} at the first position.
      (Notice that no block is awarded for the second #{color_blocks(2)} in the guess, since there is only one #{color_blocks(2)} in the code.)

      At the start of the game the player will choose to be either the CodeBREAKER or the CodeMAKER:

      If the player chooses to be the CodeBREAKER they will have 12 tries to guess the computer generated code.

      If the player chooses to be the CodeMAKER they will choose a 4 digit code that the computer will attempt to guess.

      Ready? LET'S PLAY MASTERMIND!!!
    HEREDOC
  end
<<<<<<< HEAD
  # rubocop:enable Metrics/AbcSize
=======
>>>>>>> da0a257346be0006d83413b22233864dbf07a1aa
end
