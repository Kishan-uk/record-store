require_relative('../db/sql_runner.rb')

class Album

  attr_reader :id, :title, :genre, :quantity, :buy_price, :sell_price, :artist_id

  def initialize(options)
    @id = options['id'].to_i if options ['id']
    @title = options['title']
    @genre = options['genre']
    @quantity = options['quantity'].to_i
    @buy_price = options['buy_price'].to_f
    @sell_price= options['sell_price'].to_f
    @artist_id = options['artist_id'].to_i
  end

  def save
    sql = "INSERT INTO albums
    (
      title,
      genre,
      quantity,
      buy_price,
      sell_price,
      artist_id
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
      ) RETURNING id"
      values = [@title, @genre, @quantity, @buy_price, @sell_price, @artist_id]
      result = SqlRunner.run(sql, values)
      @id = result.first()['id'].to_i
    end

    def update
      sql = "UPDATE albums SET
      (
        title,
        genre,
        quantity,
        buy_price,
        sell_price,
        artist_id
      ) =
      (
        $1, $2, $3, $4, $5, $6
      )
      WHERE id = $7"
      values = [@title, @genre, @quantity, @buy_price, @sell_price, @artist_id, @id]
      SqlRunner.run(sql, values)
    end

    def delete
      sql = "DELETE FROM albums WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def stock_level
      if @quantity > 50
        return "high"
      elsif @quantity > 25
        return "medium"
      else
        return "low"
      end
    end

    def mark_up
      result = @sell_price - @buy_price
      return sprintf("%.2f", result)
    end

    def self.find(id)
      sql = "SELECT * FROM albums WHERE id = $1"
      values = [id]
      result = SqlRunner.run(sql, values).first
      return Album.new(result)
    end

    #added for PDA
    def self.sort_by_quantity()
      sql = "SELECT * FROM albums ORDER BY quantity"
      values = [id]
      result = SqlRunner.run(sql, values).first
      return Album.new(result)
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
