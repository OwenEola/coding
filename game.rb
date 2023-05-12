require 'pry'
require './database_connection'
require './player'
#require './intro'

class Game
  #Everytime .new is called on Game method this resets the score etc
  def initialize(questions)
    @score = 0
    @questions = questions
    @name = ""
    @end_time = nil
  end

  #
  def result
    "You got #{@score}/#{@questions.length}"
  end

  #Want to move this out to intro.rb, got that file which I've done some stuff to create a menu system
  def intro
    puts '(intro music)'
    puts
    puts 'What is your name: '
    @name = gets.chomp
    puts
    puts 'What is your email: '
    @email = gets.chomp
    puts
    #Creates player
    Player.create(@name, @email)
    puts "Welcome #{@name}, the game is Who Wants to be a Millionaire. For each question you get right you move onto the next question. If you get a question wrong, it is GAME OVER !"
    puts
    puts '(intense music plays)'
    sleep 2
    puts
    puts "Let's get started!"
    puts
  end
   

  def play
    #Calls intro method, once handled in separate file need to remove comment from require !don't forget!
    intro
    #Initialize the game loop
    game_over = false
    current_question = 0
    until game_over
      if @questions[current_question].ask
        puts 'Correct! Moving on to the next question.'
        @score += 1
        current_question += 1
        puts result
        puts
      else
        puts "Incorrect #{result}. Sorry, you have lost the game."
        game_over = true
      end
      # Check if the player has won
      if current_question >= @questions.length
        puts 'Congratulations! You have won the game and become a millionaire!'
        game_over = true
      end
    end

    #Updates player score
    Player.update(@email, @score)

  end
end
