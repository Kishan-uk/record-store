DROP TABLE albums;
DROP TABLE artists;

CREATE TABLE artists
(
  id SERIAL8 primary key,
  name VARCHAR(255)
);

CREATE TABLE albums
(
  id SERIAL8 primary key,
  title VARCHAR(255),
  genre VARCHAR(255),
  quantity INT2,
  buy_price DECIMAL(12,2),
  sell_price DECIMAL(12,2),
  artist_id INT8 REFERENCES artists(id) ON DELETE CASCADE
);
