CREATE TABLE IF NOT EXISTS Genre (
id SERIAL PRIMARY KEY,
name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Artist (
id SERIAL PRIMARY KEY,
name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Album (
id SERIAL PRIMARY KEY,
name VARCHAR(255) NOT NULL,
release_year INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Track (
id SERIAL PRIMARY KEY,
name VARCHAR(255) NOT NULL,
duration INTERVAL NOT NULL,
album_id INTEGER NOT NULL,
FOREIGN KEY (album_id) REFERENCES Album(id)
);

CREATE TABLE IF NOT EXISTS Album_Artist (
album_id INTEGER NOT NULL,
artist_id INTEGER NOT NULL,
PRIMARY KEY (album_id, artist_id),
FOREIGN KEY (album_id) REFERENCES Album(id),
FOREIGN KEY (artist_id) REFERENCES Artist(id)
);

CREATE TABLE IF NOT EXISTS Compilation (
id SERIAL PRIMARY KEY,
name VARCHAR(255) NOT NULL,
release_year INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Compilation_Track (
compilation_id INTEGER NOT NULL,
track_id INTEGER NOT NULL,
PRIMARY KEY (compilation_id, track_id),
FOREIGN KEY (compilation_id) REFERENCES Compilation(id),
FOREIGN KEY (track_id) REFERENCES Track(id)
);

CREATE TABLE IF NOT EXISTS Artist_Genre (
artist_id INTEGER NOT NULL,
genre_id INTEGER NOT NULL,
PRIMARY KEY (artist_id, genre_id),
FOREIGN KEY (artist_id) REFERENCES Artist(id),
FOREIGN KEY (genre_id) REFERENCES Genre(id)
);