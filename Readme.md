[SQLZOO](http://sqlzoo.net/wiki/SQL_Tutorial) Solved Query 
=========


## 1. Tutorials: Learn SQL in stages
----------------------------------
* 0 SELECT basics
 * Some simple queries to get you started
* 1 SELECT name
  * Some pattern matching queries
* 2 SELECT from World
  * In which we query the World country profile table.
* 3 SELECT from Nobel
  * Additional practice of the basic features using a table of Nobel Prize winners.
* 4 SELECT within SELECT
  * In which we form queries using other queries.
* 5 SUM and COUNT
  * In which we apply aggregate functions. more the same
* 6 JOIN
  * In which we join two tables; game and goals. previously music tutorial
* 7 More JOIN operations
  * In which we join actors to movies in the Movie Database.
* 8 Using Null
  * In which we look at teachers in departments. previously Scottish Parliament
* 8 Numeric Examples
  * In which we look at a survey and deal with some more complex calculations.
* 9 Self join
  * In which we join Edinburgh bus routes to Edinburgh bus routes.


## 2. Tip
----------------------------------
* 2.1. ALL = 모두 반환 <-> distinct 중복제거 1개 반환
* 2.2. 서브쿼리에서 부모쿼리의 where에서 하나의 행과 나머지 행을 비교하려면 서브쿼리에 all을 붙여 주어야 함 ex) 4-8: SELECT name, continent FROM world x WHERE population > ALL (SELECT population\*3 FROM world y WHERE x.continent=y.continent AND x.name <> y.name)
* 2.3. GROUP BY 는 sum제외한 나머지 항목 해주면 됨 ex) SELECT mdate, team1,
* 2.4. SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) score1, team2,
SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) score2
FROM game LEFT JOIN goal ON matchid = id GROUP BY mdate, matchid, team1, team2
* 2.5. 이너 조인을 레프트조인으로 바꿔 줄 수 있음
* 2.6. mysql 디폴트 조인 = 이너조인 = 교차조인
* 2.7. coalesce = ifnull=nullif=nvl과 같음. ex) coalesce(party,’none’) -> party가 NULL이면 ‘none’로 치환함
* 2.8. limi은 수백만 row 에서 샘플만 보기 위한 커맨드


## 3. Todo
----------------------------------
* 3.1. https://www.bloc.io/ruby-warrior/#/warriors
* 3.2. http://wwwlgis.informatik.uni-kl.de/extra/game/
* 3.3. https://schemaverse.com/
* 3.4. http://www.sqlteaching.com/


## 4. Writer
----------------------------------
* Solved by [ur0n2](https://ur0n2.com):smiling_imp:

