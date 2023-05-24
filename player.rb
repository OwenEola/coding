require "pry"
require "./database_model"

class Player < DatabaseModel
  
  #Method to create new player in table
  #Need to add a check here to seach if email is already used, maybe like if statement on table?
  def self.create(name, email)
    (name: name, email: email)
  end

  #Method to update player who has previously played
  def self.update(email, score)
    player = find_by_email(email)
    (id: player[:id], score: score)
  end

  #Method to fetch all rows from players table
  def self.list
    all
  end

  #Method to display scoreboard, name and score from players table
  def self.scoreboard
    database.execute("SELECT name, score  FROM players")
  end

end

#binding.pry
