--# 4 SELECT within SELECT
--# 1. List each country name where the population is larger than 'Russia'. 
SELECT name FROM world WHERE population > (SELECT population FROM world WHERE name='Russia')

--# 2. Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
SELECT name FROM world WHERE continent = 'Europe' AND gdp/population >(SELECT gdp/population FROM world WHERE name ='United Kingdom')

--# 3. List the name and continent of countries in the continents containing 'Belize', 'Belgium'.
SELECT name, continent FROM world WHERE continent = (SELECT continent FROM world WHERE name='Belize') or continent=(SELECT continent FROM world WHERE name='Belgium')

--# 4. Which country has a population that is more than Canada but less than Poland? Show the name and the population.
SELECT name, population FROM world WHERE population > (SELECT population FROM world WHERE name='Canada') and population < (SELECT population FROM world WHERE name='Poland')

--# 5. Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)
SELECT name FROM world WHERE gdp > (SELECT MAX(gdp) FROM world WHERE continent='Europe')

--# 6. Find the largest country (by area) in each continent, show the continent, the name and the area:
--# 각 대륙별 area가 가장 큰 나라를 찾아라.
SELECT continent, name, area FROM world x WHERE area>= ALL (SELECT max(area) FROM world y WHERE y.continent=x.continent AND population>0)
-> ALL, AND population>0 omission possible

--# 7. Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.
--# 인구가 25이하인 나라만 있는 대륙의 나라이름을 찾아라 -> 큰범위의것(>25000000)을 먼저 찾고 앞절에서 배제 시키면 됨
SELECT name, continent, population FROM world WHERE continent NOT IN(SELECT continent FROM world WHERE population > 25000000)
--# 뒷쿼리에서 >25인 대륙을 앞 절 대륙명에서 not in 인 것들이 참인 name, continent, population만 뽑기

--# 8. Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents
--# 같은 대륙 내에서 자신을 제외한 나라들의 인구*3보다 큰 나라의 이름과 대륙을 찾아라.(한 대륙에서 모두 만족할 수 없음)
SELECT name, continent FROM world x WHERE population > ALL (SELECT population*3 FROM world y WHERE x.continent=y.continent AND x.name <> y.name)

--# 9. Show the years in which three prizes were given for Physics.
--# Physics서브젝트에서 3명이상 수상한 년도를 보여라
SELECT yr FROM nobel WHERE subject='Physics' GROUP BY yr HAVING COUNT(winner)>=3

--# 10. Show winners who have won more than once.
SELECT winner FROM nobel GROUP BY winner HAVING COUNT(winner) > 1

--# 11. Show winners who have won more than one subject.
SELECT winner FROM nobel GROUP BY winner HAVING COUNT(distinct subject) > 1
--# 한가지 이상 서브젝트에서 우승한 사람은?

--# 12. Show the year and subject where 3 prizes were given. Show only years 2000 onwards.
SELECT yr, subject FROM nobel WHERE yr>=2000 GROUP BY yr, subject HAVING COUNT(winner)=3