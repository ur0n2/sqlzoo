1. SQLZOO
=========
http://sqlzoo.net/wiki/SQL_Tutorial

1.1. Tutorials: Learn SQL in stages
----------------------------------
+ 0 SELECT basics
  + Some simple queries to get you started
+ 1 SELECT name
+ Some pattern matching queries
+ 2 SELECT from World
+ In which we query the World country profile table.
+ 3 SELECT from Nobel
+ Additional practice of the basic features using a table of Nobel Prize winners.
+ 4 SELECT within SELECT
+ In which we form queries using other queries.
+ 5 SUM and COUNT
+ In which we apply aggregate functions. more the same
+ 6 JOIN
+ In which we join two tables; game and goals. previously music tutorial
+ 7 More JOIN operations
+ In which we join actors to movies in the Movie Database.
+ 8 Using Null
+ In which we look at teachers in departments. previously Scottish Parliament
+ 8+ Numeric Examples
+ In which we look at a survey and deal with some more complex calculations.
+ 9 Self join
+ In which we join Edinburgh bus routes to Edinburgh bus routes.

2. Tip
======
2.1. ALL = ��� ��ȯ <-> distinct �ߺ����� 1�� ��ȯ
2.2. ������������ �θ������� where���� �ϳ��� ��� ������ ���� ���Ϸ��� ���������� all�� �ٿ� �־�� �� ex) 4-8: SELECT name, continent FROM world x WHERE population > ALL (SELECT population*3 FROM world y WHERE x.continent=y.continent AND x.name <> y.name)
2.3. GROUP BY �� sum������ ������ �׸� ���ָ� �� ex) SELECT mdate, team1,
2.4. SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) score1, team2,
SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) score2
FROM game LEFT JOIN goal ON matchid = id GROUP BY mdate, matchid, team1, team2
2.5. �̳� ������ ����Ʈ�������� �ٲ� �� �� ����
2.6. mysql ����Ʈ ���� = �̳����� = ��������
2.7. coalesce = ifnull=nullif=nvl�� ����. ex) coalesce(party,��none��) -> party�� NULL�̸� ��none���� ġȯ��
2.8. limi�� ���鸸 row ���� ���ø� ���� ���� Ŀ�ǵ�

3. Todo
=======
3.1. https://www.bloc.io/ruby-warrior/#/warriors
3.2. http://wwwlgis.informatik.uni-kl.de/extra/game/
3.3. https://schemaverse.com/
3.4. http://www.sqlteaching.com/