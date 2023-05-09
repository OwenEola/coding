require 'sqlite3'

class DatabaseConnection
  def initialize
    @db = SQLite3::Database.new "my_database.db"

    # Create the players table if it doesn't exist
    @db.execute <<-SQL
      create table if not exists players (
        id INTEGER PRIMARY KEY,
        created_at datetime default current_timestamp,
        name varchar(50),
        score int(5)
      );
    SQL
  end

  def execute(sql, params = [])
    @db.execute(sql, params)
  end
end
