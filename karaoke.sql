DROP TABLE guests;
DROP TABLE rooms_songs;
DROP TABLE songs;
DROP TABLE rooms;

CREATE TABLE rooms (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  capacity INT,
  price_per_person INT,
  till INT
);

CREATE TABLE songs (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  artist VARCHAR(255)
);

CREATE TABLE rooms_songs (
  id SERIAL8 PRIMARY KEY,
  rooms_id INT8 REFERENCES rooms(id),
  songs_id INT8 REFERENCES songs(id)
);

CREATE TABLE guests (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  age INT,
  wallet INT,
  in_room INT8 REFERENCES rooms(id),
  fav_song INT8 REFERENCES songs(id)
);


INSERT INTO rooms (name, capacity, price_per_person, till) VALUES ('Room 1', 4, 10, 0);

INSERT INTO songs (name, artist) VALUES ('Wilson (Expensive Mistakes)', 'Fall Out Boy');
INSERT INTO songs (name, artist) VALUES ('Champagne for My Real Friends, Real Pain for My Sham Friends', 'Fall Out Boy');
INSERT INTO songs (name, artist) VALUES ('Books from Boxes', 'Maximo Park');
INSERT INTO songs (name, artist) VALUES ('Paper Wings', 'Rise Against');
INSERT INTO songs (name, artist) VALUES ('Bedshaped', 'Keane');

INSERT INTO guests (name, age, wallet, in_room, fav_song) VALUES ('Marta', 24, 50, 1, 1);
INSERT INTO guests (name, age, wallet, in_room, fav_song) VALUES ('Andrew', 25, 50, 1, 2);
INSERT INTO guests (name, age, wallet, in_room, fav_song) VALUES ('Craig', 17, 50, 1, 3);
INSERT INTO guests (name, age, wallet, in_room, fav_song) VALUES ('David', 25, 50, 1, 4);

-- Charging guests for their room
UPDATE
  guests
SET
  wallet = (wallet - 10)
WHERE
  in_room = 1;
-- Adding money received to till (till is in the room even though that is not very accurate)
UPDATE
  rooms
SET
  wallet = (wallet - 10)
WHERE
  in_room = 1;

-- Showing the catalogue of rooms
SELECT * FROM songs ORDER BY name;

-- Printing only self-referential information from guests sorted by name
SELECT (name, age, wallet) FROM guests ORDER BY name;

-- Printing only songs by Fall Out Boy sorted by id
SELECT * FROM songs WHERE artist = 'Fall Out Boy' ORDER BY id;
