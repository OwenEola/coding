require "pry"
require "./database_connection"

class Player 
  
  #Method to create new player in table
  #Need to add a check here to seach if email is already used, maybe like if statement on table?
  def self.create(name, email)
    DatabaseConnection.run_sql("INSERT INTO players (name, email)
                                VALUES (?, ?)", [name, email])
  end

  #Method to update player who has previously played
  def self.update(email, score)
    DatabaseConnection.run_sql("UPDATE players SET score = ? WHERE email = ?", [score, email])  
  end

  #Method to fetch all rows from players table
  def self.list
    DatabaseConnection.run_sql( "select * from players" ) do |row| 
      p row 
    end
  end 

  #Method to display scoreboard, name and score from players table
  def self.scoreboard
    DatabaseConnection.run_sql( "SELECT name, score  FROM players" ) do |row| 
      p row 
    end
  end 

end

#binding.pry
