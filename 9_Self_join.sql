--# 9 Self join
--# 1. How many stops are in the database.
SELECT COUNT(*) FROM stops

--# 2. Find the id value for the stop 'Craiglockhart'
SELECT id FROM stops WHERE name='Craiglockhart'

--# 3. Give the id and the name for the stops on the '4' 'LRT' service.
SELECT id, name FROM stops JOIN route ON stops.id=route.stop WHERE num=4 AND company='LRT'

--# 4. The query shown gives the number of routes that visit either London Road (149) or Craiglockhart (53). Run the query and notice the two services that link these stops have a count of 2. Add a HAVING clause to restrict the output to these two routes.
SELECT company, num, COUNT(*) FROM route WHERE stop=149 OR stop=53 GROUP BY company, num HAVING COUNT(*)=2

--# 5. Execute the self join shown and observe that b.stop gives all the places you can get to from Craiglockhart, without changing routes. Change the query so that it shows the services from Craiglockhart to London Road.
SELECT a.company, a.num, a.stop, b.stop FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num) WHERE a.stop=53 AND b.stop=149

--# 6. The query shown is similar to the previous one, however by joining two copies of the stops table we can refer to stops by name rather than by number. Change the query so that the services between 'Craiglockhart' and 'London Road' are shown. If you are tired of these places try 'Fairmilehead' against 'Tollcross'
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='London Road'

--# 7. Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith')
SELECT distinct a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num) JOIN stops WHERE a.stop=115 AND b.stop=137

--# 8. Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross’'
SELECT distinct a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num) JOIN stops c ON (a.stop=c.id) JOIN stops d ON (b.stop=d.id) WHERE c.name='Tollcross' AND d.name='Craiglockhart'


--# 9.Give a distinct list of the stops which may be reached from 'Craiglockhart' by taking one bus, including 'Craiglockhart' itself. Include the company and bus no. of the relevant services.
SELECT distinct d.name, a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num) JOIN stops c ON (a.stop=c.id) JOIN stops d ON (b.stop=d.id) WHERE c.name='Craiglockhart'

--# 10. Find the routes involving two buses that can go from Craiglockhart to Sighthill.
Show the bus no. and company for the first bus, the name of the stop for the transfer,
and the bus no. and company for the second bus. 
Craiglockhart 에서 Sighthill 로 가는 2개의 버스 경로를 포함한 경로 찾기
SELECT distinct firstbus.num, firstbus.company, trans.name, secondbus.num, secondbus.company

FROM route firstbus
JOIN route secondbus ON (secondbus.num <> firstbus.num OR secondbus.company <> firstbus.company)
JOIN route firstbus0 ON (firstbus0.num = firstbus.num AND firstbus0.company = firstbus.company)
JOIN route secondbus0 ON (secondbus0.num = secondbus.num AND secondbus0.company = secondbus.company)
JOIN stops start ON (start.id = firstbus0.stop)
JOIN stops end ON (end.id = secondbus0.stop)
JOIN stops trans ON (trans.id <> start.id AND trans.id <> end.id)

WHERE firstbus.stop = secondbus.stop
AND firstbus.stop = trans.id
AND start.name = 'Craiglockhart'
AND end.name = 'Sighthill'

order by cast(firstbus.num as int) ASC, cast(secondbus.num as int) ASC, trans.name ASC