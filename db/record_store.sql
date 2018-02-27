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
  quantity INT2,
  artist_id INT4 REFERENCES artists(id) ON DELETE CASCADE
);
