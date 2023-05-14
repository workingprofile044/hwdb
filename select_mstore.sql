SELECT name, release_year
FROM Album
WHERE release_year = 2018;

SELECT name, duration
FROM Track
WHERE duration = (
  SELECT MAX(duration)
  FROM Track
);

SELECT name, duration
FROM Track
WHERE duration >= '00:03:30';

SELECT name
FROM Compilation
WHERE release_year BETWEEN 2018 AND 2020;

SELECT name
FROM Artist
WHERE name NOT LIKE '% %';

SELECT name, duration
FROM Track
WHERE name LIKE '%My%';
