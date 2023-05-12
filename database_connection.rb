require 'sqlite3'

class DatabaseConnection
  def self.database_instance
    @db = SQLite3::Database.new "my_database.db"

    # Create the players table if it doesn't exist
    @db.execute <<-SQL
      create table if not exists players (
        id INTEGER PRIMARY KEY,
        created_at datetime default current_timestamp,
        name varchar(50),
        email varchar(100) unique,
        score int
      );
    SQL
    @db
  end

  def self.run_sql(sql, params = [])
    database_instance.execute(sql, params)
  end
end
