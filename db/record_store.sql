DROP TABLE artists;
DROP TABLE albums;

CREATE TABLE albums
(
  id SERIAL8 primary key,
  title VARCHAR(255) not null,
  quantity INT2
);

CREATE TABLE artists
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null
);
