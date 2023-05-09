require 'sqlite3'

class DatabaseConnection
  def initialize
    @db = SQLite3::Database.new ":memory:"

    # Create the players table if it doesn't exist
    @db.execute <<-SQL
      create table if not exists players (
        id INTEGER PRIMARY KEY,
        name varchar(50),
        score int(5)
      );
    SQL
  end

  def execute(sql, params = [])
    @db.execute(sql, params)
  end
end
