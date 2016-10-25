--# 6 Music Tutorial
--# 1. Find the title and artist who recorded the song 'Alison'.
SELECT title, artist FROM album JOIN track ON album.asin=track.album WHERE song='Alison'

--# 2. Which artist recorded the song 'Exodus'?
SELECT artist FROM album JOIN track ON album.asin=track.album WHERE song='Exodus'

--# 3. Show the song for each track on the album 'Blur'
SELECT song FROM album JOIN track ON album.asin=track.album WHERE Artist='Blur'
--# Blur의 앨범 트랙의 song들을 뽑아라

--# 4. For each album show the title and the total number of track.
SELECT title, COUNT(*) as total FROM album JOIN track ON (album.asin=track.album) GROUP BY title

--# 5. For each album show the title and the total number of tracks containing the word 'Heart' SELECT distinct title, count(*) FROM album JOIN track ON album.asin=track.album WHERE song LIKE '%Heart%' GROUP BY title

--# 6. A "title track" is where the song is the same as the title. Find the title tracks.
SELECT song FROM album JOIN track ON album.asin=track.album WHERE song=title

--# 7. An "eponymous" album is one where the title is the same as the artist (for example the album 'Blur' by the band 'Blur'). Show the eponymous albums.
SELECT distinct title FROM album JOIN track ON album.asin=track.album WHERE title=artist

--# 8. Find the songs that appear on more than 2 albums. Include a count of the number of times each shows up.
SELECT song, COUNT(DISTINCT album) FROM album JOIN track ON album.asin=track.album GROUP BY song HAVING COUNT(distinct album)>2

--# 9. A "good value" album is one where the price per track is less than 50 pence. Find the good value album - show the title, the price and the number of tracks. 
SELECT title, price, COUNT(song) FROM album JOIN track ON (asin=album) GROUP BY title HAVING PRICE/COUNT(song) < 0.50
--# price/트랙갯수=트랙당가격
--# 트랙가격>50pence인 앨범과 song갯수를 뽑아라

--# 10. Wagner's Ring cycle has an imposing 173 tracks, Bing Crosby clocks up 101 tracks.
List albums so that the album with the most tracks is first. Show the title and the number of tracks
SELECT title, COUNT(song) FROM album JOIN track ON asin=album GROUP BY title HAVING COUNT(song) ORDER BY COUNT(song) desc
--# 앨범별로 트랙의 갯수=asin=song