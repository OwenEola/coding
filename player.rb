require "pry"
require "./database_connection"

class Player 
  #Method to fetch all rows from players table
  def self.list
    DatabaseConnection.run_sql( "select * from players" ) do |row| 
      p row 
    end
  end 

  #Method to create new player in table
  def self.create(name, score)
    DatabaseConnection.run_sql("INSERT INTO players (name, score)
                                VALUES (?, ?)", [name, score])
  end

  #Method to 
end

#binding.pry
