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
--# �� ����� area�� ���� ū ���� ã�ƶ�.
SELECT continent, name, area FROM world x WHERE area>= ALL (SELECT max(area) FROM world y WHERE y.continent=x.continent AND population>0)
-> ALL, AND population>0 omission possible

--# 7. Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.
--# �α��� 25������ ���� �ִ� ����� �����̸��� ã�ƶ� -> ū�����ǰ�(>25000000)�� ���� ã�� �������� ���� ��Ű�� ��
SELECT name, continent, population FROM world WHERE continent NOT IN(SELECT continent FROM world WHERE population > 25000000)
--# ���������� >25�� ����� �� �� ������� not in �� �͵��� ���� name, continent, population�� �̱�

--# 8. Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents
--# ���� ��� ������ �ڽ��� ������ ������� �α�*3���� ū ������ �̸��� ����� ã�ƶ�.(�� ������� ��� ������ �� ����)
SELECT name, continent FROM world x WHERE population > ALL (SELECT population*3 FROM world y WHERE x.continent=y.continent AND x.name <> y.name)

--# 9. Show the years in which three prizes were given for Physics.
--# Physics������Ʈ���� 3���̻� ������ �⵵�� ������
SELECT yr FROM nobel WHERE subject='Physics' GROUP BY yr HAVING COUNT(winner)>=3

--# 10. Show winners who have won more than once.
SELECT winner FROM nobel GROUP BY winner HAVING COUNT(winner) > 1

--# 11. Show winners who have won more than one subject.
SELECT winner FROM nobel GROUP BY winner HAVING COUNT(distinct subject) > 1
--# �Ѱ��� �̻� ������Ʈ���� ����� �����?

--# 12. Show the year and subject where 3 prizes were given. Show only years 2000 onwards.
SELECT yr, subject FROM nobel WHERE yr>=2000 GROUP BY yr, subject HAVING COUNT(winner)=3