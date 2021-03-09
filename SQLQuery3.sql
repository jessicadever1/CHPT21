
SELECT 
Artist.ArtistName,
Genre.Label
FROM Album
LEFT JOIN Artist on Album.ArtistId = Artist.Id
LEFT JOIN Genre on Album.GenreId = Genre.Id
WHERE GenreId = 2;