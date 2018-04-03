require_relative '../db/sql_runner'

class Joint
  attr_accessor :name, :address, :url
  attr_reader :id

  def initialize options
    @name = options['name']
    @address = options['address']
    @url = options['url'] ||= ''
    @id =  options['id'].to_i if options['id']
  end

  def save
    sql = "
      INSERT INTO joints (name, address, url)
      VALUES ($1, $2, $3)
      RETURNING id;
    "
    values = [@name, @address, @url]
    @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  def update
    sql = "
      UPDATE joints
      SET (name, address, url)
        = ($1, $2, $3)
      WHERE id = $4;
    "
    values = [@name, @address, @url, @id]
    SqlRunner.run sql, values
  end

    def delete
      sql = "
        DELETE FROM joints
        WHERE id = $1;
      "
      values = [@id]
      SqlRunner.run sql, values
    end

    def self.find_id id
      sql = "
        SELECT * FROM joints
        WHERE id = $1;
      "
      values = [id]
      result = SqlRunner.run(sql, values).first
      return result != nil ? Joint.new(result) : nil
    end

  def self.all
    sql = "
      SELECT * FROM joints;
    "
    result = SqlRunner.run sql
    return result.first != nil ? result.map { |e| Joint.new(e) } : nil
  end

  def self.delete_all
    sql = "
      DELETE FROM joints;
    "
    SqlRunner.run sql
  end
end
