--# 7 More JOIN operations
--# 1. List the films where the yr is 1962 [Show id, title]
SELECT id, title FROM movie WHERE yr=1962

--# 2. Give year of 'Citizen Kane'.
SELECT yr FROM movie WHERE title='Citizen Kane'

--# 3. List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.
SELECT id, title, yr FROM movie WHERE title LIKE '%Star Trek%' ORDER BY yr

--# 4. What are the titles of the films with id 11768, 11955, 21191 
SELECT title FROM movie WHERE id IN(11768, 11955, 21191)

--# 5. What id number does the actor 'Glenn Close' have?
SELECT id FROM actor WHERE name='Glenn Close'

--# 6. What is the id of the film 'Casablanca'
SELECT id FROM movie WHERE title='Casablanca'

--# 7. Obtain the cast list for 'Casablanca'. Use the id value that you obtained in the previous question.
SELECT actor.name FROM actor JOIN casting ON actor.id=casting.actorid WHERE movieid=(SELECT id FROM movie WHERE title='Casablanca')

--# 8. Obtain the cast list for the film 'Alien'
SELECT actor.name FROM actor JOIN casting ON actor.id=casting.actorid WHERE movieid=(SELECT id FROM movie WHERE title='Alien')

--# 9. List the films in which 'Harrison Ford' has appeared
SELECT movie.title FROM movie JOIN casting ON movie.id=casting.movieid JOIN actor ON actorid=actor.id WHERE actor.name='Harrison Ford'
--# left join -> movie, casting, actor 순서로 캐스팅 중간에 두고 조인 한거임
--# ref: http://sqlzoo.net/wiki/Get_to_the_point

--# 10. List the films where 'Harrison Ford' has appeared - but not in the star role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]
--# starring role=주역
SELECT title FROM movie JOIN casting ON movie.id=casting.movieid
JOIN actor ON actorid=actor.id
WHERE name='Harrison Ford' AND casting.ord!=1
--# ord=1이면 주역

--# 11. List the films together with the leading star for all 1962 films.
SELECT title, name FROM movie JOIN casting ON movie.id=casting.movieid JOIN actor ON actorid=actor.id WHERE movie.yr=1962 AND ord=1

--# 12. Which were the busiest years for 'John Travolta', show the year and the number of movies he made each year for any year in which he made more than 2 movies. 
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
     	JOIN actor   ON actorid=actor.id
WHERE name='John Travolta'
GROUP BY yr
HAVING COUNT(title)=(SELECT MAX(c) FROM
(SELECT yr,COUNT(title) AS c FROM
   movie JOIN casting ON movie.id=movieid
     	JOIN actor   ON actorid=actor.id
 WHERE name='John Travolta'
 GROUP BY yr) AS t
)

--# 13. List the film title and the leading actor for all of the films 'Julie Andrews' played in. 
--# JULIE 작품의 ord=1인 title, name
--# name='Julie Andrews'인 movieid, actorid
SELECT movieid, actorid FROM casting JOIN actor ON actorid=id WHERE name='Julie Andrews'

--# name='Julie Andrews'인 movieid에 해당하는 영화의 lead actor(ord=1), movieid
SELECT movieid, actorid FROM casting JOIN actor ON actorid=id WHERE ord=1 AND movieid IN (SELECT movieid FROM casting JOIN actor ON actorid=id WHERE name='Julie Andrews') 

--# name='Julie Andrews'인 movieid에 해당하는 영화의 lead actor(ord=1)에 해당하는 name, movieid에 해당하는 title
SELECT title,name FROM  movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id JOIN (SELECT movieid, actorid FROM casting JOIN actor ON actorid=id WHERE ord=1 AND movieid IN (SELECT movieid FROM casting JOIN actor ON actorid=id WHERE name='Julie Andrews') ) as t WHERE movie.id=t.movieid AND actor.id=t.actorid

#t.movieid에 해당하는 타이틀과 t.actorid에 해당하는 name

--# 14. Obtain a list in alphabetical order of actors who've had at least 30 starring roles.
SELECT name FROM movie JOIN casting ON movie.id=movieid JOIN actor ON actor.id=actorid WHERE ord=1 GROUP BY name HAVING COUNT(name)>=30
--# ord=1이 최소 30번 이상인 사람

--# 15. List the films released in the year 1978 ordered by the number of actors in the cast.
SELECT title, COUNT(actorid) as actors FROM movie JOIN casting ON movie.id=casting.movieid WHERE yr=1978 GROUP BY title ORDER BY actors desc
--# yr=1978 title, actor 순으로 정렬

--# 16. List all the people who have worked with 'Art Garfunkel'
--# ?????
SELECT actor.name  FROM casting
JOIN movie ON movie.id=casting.movieid
JOIN actor ON  actor.id=casting.actorid
WHERE
actor.name !='Art Garfunkel'
AND
movie.id IN(SELECT movie.id FROM casting
JOIN movie ON movie.id=casting.movieid
JOIN actor ON  actor.id=casting.actorid
WHERE actor.name='Art Garfunkel')
--# ??????