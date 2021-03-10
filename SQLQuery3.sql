--Task 3
select s.Title,
a.ArtistName
from song s left join Artist a on s.ArtistId = a.id;

--Task 4 & 5
SELECT 
Artist.ArtistName,
Genre.Label
FROM Album
LEFT JOIN Artist on Album.ArtistId = Artist.Id
LEFT JOIN Genre on Album.GenreId = Genre.Id
WHERE GenreId = 2 OR GenreId = 4;


--Task 6
SELECT DISTINCT
Album.Id,
Album.Title
FROM Album
LEFT JOIN Song ON Album.Id = Song.AlbumId
WHERE Song.AlbumId IS NULL
ORDER BY Title;

--Task 7
INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('Bon Jovi', 1983);
SELECT 
ArtistName,
YearEstablished,
Id
FROM Artist
ORDER BY ArtistName;

--Task 8
INSERT INTO Genre (Label) VALUES ('Glam Metal');
INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) 
VALUES ('Slippery When Wet', '8/18/1986', 43, 'Mercury', 28, 15);
SELECT * FROM Album



