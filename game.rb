require 'pry'
require './database_connection'

class Game
  def initialize(questions)
    @score = 0
    @questions = questions
    @name = ""
    @end_time = nil
  end

  def scoreboard
    "You got #{@score}/#{@questions.length}"
  end

  def intro
    puts '(intro music)'
    puts
    puts 'What is your name: '
    @name = gets.chomp
    puts
    puts "Welcome #{@name}, the game is Who Wants to be a Millionaire. For each question you get right you move onto the next question. If you get a question wrong, it is GAME OVER !"
    puts
    puts '(intense music plays)'
    sleep 2
    puts
    puts "Let's get started!"
    puts
  end

  def play
    intro
    # Initialize the game loop
    game_over = false
    current_question = 0

    until game_over
      if @questions[current_question].ask
        puts 'Correct! Moving on to the next question.'
        @score += 1
        current_question += 1
        puts scoreboard
        puts
      else
        puts "Incorrect #{scoreboard}. Sorry, you have lost the game."
        game_over = true
      end
      # Check if the player has won
      if current_question >= @questions.length
        puts 'Congratulations! You have won the game and become a millionaire!'
        game_over = true
      end
    end

    # Store the player's name & score in the database
     db = DatabaseConnection.new
      db.execute("INSERT INTO players (name, score)
              VALUES (?, ?)", [@name, @score])
    #binding.pry 
  end
end

