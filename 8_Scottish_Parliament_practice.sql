--# 8 Scottish Parliament
--# 1. One MSP was kicked out of the Labour party and has no party. Find him.
--# Constituency=선거구
--# MSP=Members of the Scottish Parliament  = 스코틀랜드 국회의원
SELECT name FROM msp WHERE party IS NULL

--# 2. Obtain a list of all parties and leaders.
SELECT party.Name, Leader FROM party

--# 3. Give the party and the leader for the parties which have leaders.
SELECT party.name, leader FROM party WHERE leader IS NOT NULL

--# 4. Obtain a list of all parties which have at least one MSP.
SELECT distinct party.name FROM party JOIN msp ON party=code

--# 5. Obtain a list of all MSPs by name, give the name of the MSP and the name of the party where available. Be sure that Canavan MSP, Dennis is in the list. Use ORDER BY msp.name to sort your output by MSP. 
SELECT msp.name, party.name FROM msp LEFT OUTER JOIN party ON party=code ORDER BY msp.name

--# 6. Obtain a list of parties which have MSPs, include the number of MSPs. 
SELECT party.name, COUNT(msp.name) FROM msp LEFT OUTER JOIN party ON party=code WHERE party.name is not null GROUP BY name

--# 7. A list of parties with the number of MSPs; include parties with no MSPs. 
SELECT party.name, COUNT(msp.name) FROM msp RIGHT JOIN party ON party=code WHERE party.name is not null GROUP BY name