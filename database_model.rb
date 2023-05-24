class DatabaseModel

  def self.database
    @database ||= SQLite3::Database.new("my_database.db")
  end

  def self.find_by_id(id)
    sql = <<-SQL
      SELECT * FROM #{self.table_name} WHERE id = ?
    SQL
    self.database.execute(sql, id)
  end

  def self.find_by_name(name)
    sql = <<-SQL
      SELECT * FROM #{self.table_name} WHERE name = ?
    SQL
    self.database.execute(sql, name)
  end

  def self.find_by(attribute_hash)
    attribute_hash.map do |key, value|
      sql = <<-SQL
        SELECT * FROM #{self.table_name} WHERE #{key} = ?
      SQL
      self.database.execute(sql, value)
    end
  end

  def self.table_name
    self.to_s.downcase.pluralize
  end

  def self.all
    sql = <<-SQL
      SELECT * FROM #{self.table_name}
    SQL
    self.database.execute(sql)
  end

  def self.create(attributes_hash)
    sql = <<-SQL
      INSERT INTO #{self.table_name} (#{attributes_hash.keys.join(", ")})
      VALUES (#{attributes_hash.values.map{|value| "'#{value}'"}.join(", ")})
    SQL
    self.database.execute(sql)
  end

  def self.update(attributes_hash)
    sql = <<-SQL
      UPDATE #{self.table_name} SET #{attributes_hash.keys.join(" = ?, ")} = ?
      WHERE id = ?
    SQL
    self.database.execute(sql, *attributes_hash.values, attributes_hash[:id])
  end

  def self.delete(id)
    sql = <<-SQL
      DELETE FROM #{self.table_name} WHERE id = ?
    SQL
    self.database.execute(sql, id)
  end

  def self.delete_all
    sql = <<-SQL
      DELETE FROM #{self.table_name}
    SQL
    self.database.execute(sql)
  end

  def self.drop_table
    sql = <<-SQL
      DROP TABLE IF EXISTS #{self.table_name}
    SQL
    self.database.execute(sql)
  end

  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS #{self.table_name} (
        id INTEGER PRIMARY KEY,
        name TEXT
      )
    SQL
    self.database.execute(sql)
  end

end
