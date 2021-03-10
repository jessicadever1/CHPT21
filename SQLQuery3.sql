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

--Task 9
INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) 
VALUES ('You Give Love a Bad Name', 243, '8/18/1982', 18, 28, 23);
Select * FROM Song

--Task 10

/*Jess's Solution (After watching Andy's)*/
SELECT 
Song.Title AS SongTitle,
Album.Title AS AlbumTitle,
Artist.ArtistName
FROM Song
	LEFT JOIN Album ON Song.AlbumId = Album.Id
	LEFT JOIN Artist ON Album.ArtistId = Artist.Id
WHERE Artist.Id = 28;

-- Andy's Solution

SELECT song.title as SongTitle, Album.Title as AlbumTitle, Artist.ArtistName
FROM Song
LEFT JOIN Album ON Song.AlbumId = Album.Id
LEFT JOIN Artist ON Song.ArtistId = Artist.Id
WHERE song.title = 'TV Party' OR song.title = 'Thug' OR Artist.ArtistName = 'Beatles';

--Task 11
/*
Write a SELECT statement to display how many songs exist for 
each album. You'll need to use the COUNT() function and the 
GROUP BY keyword sequence.
*/

SELECT COUNT(Song.Id), Album.Title AS AlbumTitle
	FROM Song
		LEFT JOIN Album ON Song.AlbumId = Album.id
		GROUP BY Album.Title;

--Task 12
/*
Write a SELECT statement to display how many songs exist 
for each artist. You'll need to use the COUNT() function 
and the GROUP BY keyword sequence.
*/

SELECT COUNT(Song.Id) AS SongCount, Artist.ArtistName
	FROM Song
	LEFT JOIN Artist ON Song.ArtistId = Artist.Id
	GROUP BY Artist.ArtistName;

--Task 13
/*
Write a SELECT statement to display how many songs 
exist for each genre. You'll need to use the COUNT() 
function and the GROUP BY keyword sequence.
*/

SELECT COUNT(Song.Id) AS NumOfSongs, Genre.Label
	FROM Song 
	LEFT JOIN Genre ON Song.GenreId = Genre.Id
	GROUP BY Genre.Label;

SELECT * FROM Genre

--Task 14
/*
Write a SELECT query that lists the Artists that have put out records 
on more than one record label. Hint: When using GROUP BY instead of 
using a WHERE clause, use the HAVING keyword
*/

SELECT COUNT(DISTINCT Album.Label), Artist.ArtistName
FROM Artist JOIN Album ON Artist.Id = Album.ArtistId
GROUP BY Artist.ArtistName
HAVING COUNT(DISTINCT Album.Label) > 1;

--Task 15
/*

*/

--Task 16

/*
Using MAX() function, write a select statement to find the song with the 
longest duration. The result should display the song title and the duration.
*/

SELECT song.Title, song.SongLength
FROM song
WHERE song.SongLength = (
	SELECT MAX(song.SongLength)
	FROM song);


--or

SELECT  TOP 1 song.Title, song.SongLength
	FROM song
	ORDER BY song.SongLength desc;