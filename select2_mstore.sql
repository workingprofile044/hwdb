SELECT g.name AS genre, COUNT(*) AS number_of_artists
FROM Artist AS a
JOIN Artist_Genre AS ag ON a.id = ag.artist_id
JOIN Genre AS g ON ag.genre_id = g.id
GROUP BY g.name;

SELECT COUNT(*) 
FROM Track
INNER JOIN Album ON Track.album_id = Album.id
WHERE Album.release_year BETWEEN 2019 AND 2020;

SELECT Album.name, AVG(EXTRACT(epoch FROM Track.duration)) as avg_duration
FROM Album
JOIN Track ON Album.id = Track.album_id
GROUP BY Album.name;

SELECT *
FROM Artist
WHERE id NOT IN (
SELECT DISTINCT Artist.id
FROM Artist
JOIN Album_Artist ON Artist.id = Album_Artist.artist_id
JOIN Album ON Album_Artist.album_id = Album.id
WHERE Album.release_year = 2020
);

SELECT c.name
FROM Compilation c
JOIN Compilation_Track ct ON c.id = ct.compilation_id
JOIN Track t ON ct.track_id = t.id
JOIN Album a ON t.album_id = a.id
JOIN Album_Artist aa ON a.id = aa.album_id
JOIN Artist ar ON aa.artist_id = ar.id
WHERE ar.name = 'Michael Jackson';

SELECT Album.name
FROM Album
JOIN Album_Artist ON Album.id = Album_Artist.album_id
JOIN Artist_Genre ON Album_Artist.artist_id = Artist_Genre.artist_id
GROUP BY Album.id, Album.name
HAVING COUNT(DISTINCT Artist_Genre.genre_id) > 1;

SELECT name
FROM Track
WHERE id NOT IN (
  SELECT track_id
  FROM Compilation_Track
);

SELECT Artist.name, Track.name, Track.duration
FROM Artist
JOIN Album_Artist ON Artist.id = Album_Artist.artist_id
JOIN Album ON Album_Artist.album_id = Album.id
JOIN Track ON Album.id = Track.album_id
WHERE Track.duration = (SELECT MIN(duration) FROM Track);

SELECT album.name
FROM Album
JOIN Track ON Album.id = Track.album_id
GROUP BY Album.id
HAVING COUNT(*) = (
  SELECT COUNT(*)
  FROM Track
  GROUP BY album_id
  ORDER BY COUNT(*) ASC
  LIMIT 1
);




