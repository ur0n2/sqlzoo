--# 3 SELECT from Nobel
--# 1. Change the query shown so that it displays Nobel prizes for 1950.
SELECT yr, subject, winner FROM nobel WHERE yr = 1950

--# 2. Show who won the 1962 prize for Literature.
SELECT winner FROM nobel WHERE yr = 1962 AND subject = 'Literature'
--# 
3. Show the year and subject that won 'Albert Einstein' his prize.
SELECT yr, subject FROM nobel WHERE winner='Albert Einstein'

--# 4. Give the name of the 'Peace' winners since the year 2000, including 2000.
SELECT winner FROM nobel WHERE yr>=2000 AND subject='Peace'

--# 5. Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.
SELECT yr, subject, winner FROM nobel WHERE subject='Literature' AND yr between 1980 and 1989

--# 6. Show all details of the presidential winners: ('Theodore Roosevelt', 'Woodrow Wilson', 'Jed Bartlet', 'Jimmy Carter')
SELECT * FROM nobel WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jed Bartlet', 'Jimmy Carter')

--# 7. Show the winners with first name John
SELECT winner FROM nobel WHERE winner LIKE 'John%'

--# 8. In which years was the Physics prize awarded but no Chemistry prize. (WARNING - this question is way too hard for this level, you will need to use sub queries or joins).
SELECT distinct yr FROM nobel WHERE subject='Physics' AND yr not in (SELECT distinct yr FROM nobel WHERE subject='Chemistry')