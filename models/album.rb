require_relative('../db/sql_runner.rb')

class Album

  attr_reader :id, :title, :quantity, :artist_id

  def initialize(options)
    @id = options['id'].to_i if options ['id']
    @title = options['title']
    @quantity = options['quantity'].to_i
    @artist_id = options['artist_id'].to_i
  end


  def save
    sql = "INSERT INTO albums
    (
      title,
      quantity,
      artist_id
    )
    VALUES
    (
      $1, $2, $3
      ) RETURNING id"
      values = [@title, @quantity, @artist_id]
      result = SqlRunner.run(sql, values)
      @id = result.first()['id'].to_i
    end

    def stock_level
      if @quantity > 50
        return "stock level is high"
      elsif @quantity > 25
        return "stock level is medium"
      else
        return "stock level is low"
      end
    end

    def self.delete_all()
      sql = "DELETE FROM albums"
      SqlRunner.run(sql)
    end

    def self.all()
      sql = "SELECT * FROM albums"
      albums = SqlRunner.run(sql)
      return albums.map {|album| Album.new(album)}
    end

  end
