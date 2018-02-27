require_relative('../db/sql_runner.rb')

class Artist

  attr_reader :name, :id

  def initialize(options)
    @id = options['id'].to_i if options ['id']
    @name = options['name']
  end


  def save
    sql = "INSERT INTO artists
    (
      name
    )
    VALUES
    (
      $1
    )
    RETURNING id"
      values = [@name]
      result = SqlRunner.run(sql, values)
      @id = result.first()['id'].to_i
    end

    def self.find(id)
      sql = "SELECT * from artists where id = $1"
      values = [id]
      result = SqlRunner.run(sql, values).first
      return Artist.new(result)
    end

    def self.delete_all()
      sql = "DELETE FROM artists"
      SqlRunner.run(sql)
    end

    def self.all()
      sql = "SELECT * FROM artists"
      artists = SqlRunner.run(sql)
      return artists.map {|artist| Artist.new (artist)}
    end

  end
