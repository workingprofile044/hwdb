INSERT INTO Genre (name) VALUES
('Rock'),
('Pop'),
('Jazz'),
('Hip Hop'),
('Electronic');

INSERT INTO Artist (name) VALUES
('The Beatles'),
('Michael Jackson'),
('Miles Davis'),
('Eminem'),
('Daft Punk'),
('Elvis Presley'),
('Beyonce'),
('Radiohead');

INSERT INTO Album (name, release_year) VALUES
('Abbey Road', 1969),
('Thriller', 1982),
('Kind of Blue', 1959),
('The Slim Shady LP', 1999),
('Random Access Memories', 2013),
('Elvis Presley', 1956),
('Lemonade', 2016),
('OK Computer', 1997);

INSERT INTO Album_Artist (album_id, artist_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8);

INSERT INTO Track (name, duration, album_id) VALUES
('Come Together', '00:04:20', 1),
('Something', '00:03:03', 1),
('Billie Jean', '00:04:54', 2),
('Beat It', '00:04:17', 2),
('So What', '00:09:22', 3),
('Blue in Green', '00:05:37', 3),
('My Name Is', '00:04:28', 4),
('Guilty Conscience', '00:03:20', 4),
('Get Lucky', '00:06:07', 5),
('Instant Crush', '00:05:37', 5),
('Blue Suede Shoes', '00:01:58', 6),
('Hound Dog', '00:02:16', 6),
('Formation', '00:03:26', 7),
('Sorry', '00:03:21', 7),
('Paranoid Android', '00:06:27', 8);

INSERT INTO Compilation (name, release_year) VALUES
('Now That''s What I Call Music! 1', 1983),
('The Essential Michael Jackson', 2005),
('Jazz for a Rainy Day', 2018),
('Hip Hop Classics', 2016),
('Electronic Dance Music Anthems', 2019),
('Elvis 30 #1 Hits', 2002),
('Beyonce: The Platinum Edition', 2014),
('Radiohead: The Best Of', 2008) ;

INSERT INTO Compilation_Track (compilation_id, track_id) VALUES
(1, 4),
(1, 8),
(1, 13),
(2, 3),
(2, 4),
(2, 7),
(2, 8),
(3, 5),
(3, 6),
(4, 4),
(4, 7),
(4, 8),
(5, 9),
(5, 10),
(5, 14),
(6, 11),
(6, 12),
(7, 13),
(7, 14),
(8, 15);

INSERT INTO Artist_Genre (artist_id, genre_id) VALUES
(1, 1),
(1, 3),
(2, 2),
(2, 4),
(3, 3),
(3, 1),
(4, 4),
(5, 5),
(6, 1),
(6, 2),
(7, 2),
(7, 4),
(8, 1);
