require "pry"
require "./database_connection"

class Player 
  def self.list
    DatabaseConnection.run_sql( "select * from players" ) do |row| 
      p row 
    end
  end 
end

binding.pry
