require_relative '../db/sql_runner'

class Burger
  attr_accessor :name, :stars, :price, :joint_id
  attr_reader :id

  def initialize options
    @name = options['name']
    @stars = options['stars'].to_i
    @price = options['price'].to_f
    @joint_id = options['joint_id'].to_i
    @id = options['id'].to_i
  end

  def save
    sql = "
      INSERT INTO burgers (name, stars, price, joint_id)
      VALUES ($1, $2, $3, $4)
      RETURNING id;
    "
    values = [@name, @stars, @price, @joint_id]
    @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  def delete
    sql = "
      DELETE FROM burgers
      WHERE id = $1;
    "
    values = [@id]
    SqlRunner.run sql, values
  end

    def self.find_id id
      sql = "
        SELECT * FROM burgers
        WHERE id = $1;
      "
      values = [id]
      result = SqlRunner.run(sql, values).first
      return result != nil ? Burger.new(result) : nil
    end

  def self.all
    sql = "
      SELECT * FROM burgers;
    "
    result = SqlRunner.run sql
    return result.first != nil ? result.map { |e| Burger.new(e) } : nil
  end

  def self.delete_all
    sql = "
      DELETE FROM burgers;
    "
    SqlRunner.run sql
  end
end
