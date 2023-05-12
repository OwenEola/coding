require './database_connection'
require './player'

def intro
  loop do
    puts '*******************'
    puts '*******************'
    puts '****           ****'
    puts '**** Who Whats ****'
    puts '****  To Be A  ****'
    puts '****Millionaire****'    
    puts '****           ****'
    puts '*******************'
    puts '*******************'
    puts
    puts 'Welcome to Who Wants to be a Millionnaire ! To get started enter the number of the menu item you would like to choose below:'
    puts
    puts '1. Create Player'
    puts '2. Scoreboard'
    puts '3. Start Game'
    
    menu_answer = gets.chomp

    case menu_answer
    when '1'
      puts 'Name: '
      name = gets.chomp
      puts 'Email: '
      email = gets.chomp
      Player.create(name, email)
      puts 'Player created'
    when '2'
      puts Player.list
    when '3'
      break
    else
      puts 'Invalid input, please try again !'
    end
  end
end

#intro
