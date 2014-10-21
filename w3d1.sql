SELECT name, continent, population
FROM world 
WHERE continent IN (
SELECT continent
FROM world
GROUP BY
continent
HAVING MAX(population) < 25000000)

SELECT name, continent
FROM world x
WHERE population / 3 > ALL (
SELECT population
FROM world y
WHERE x.continent = y.continent 
AND x.name != y.name
)

SELECT continent, COUNT(name)
FROM world
WHERE population > 10000000
GROUP BY
continent

SELECT continent
FROM world
GROUP BY
continent
HAVING SUM(population) > 100000000

SELECT teacher.name, dept.name
FROM teacher
LEFT OUTER JOIN dept ON teacher.dept = dept.id
WHERE teacher.name IS NOT NULL

UNION

SELECT teacher.name, dept.name
FROM teacher
RIGHT OUTER JOIN dept ON teacher.dept = dept.id
WHERE teacher.name IS NOT NULL

-- How to merge?
SELECT institution, SUM(sample)
FROM nss
WHERE question='Q01'
AND (institution LIKE '%Manchester%')
GROUP BY institution


SELECT institution, SUM(sample)
FROM nss
WHERE question='Q01'
AND (institution LIKE '%Manchester%')
AND subject = '(8) Computer Science'
GROUP BY institution

-- 7:

SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=115 AND b.stop = 137

-- 8:

SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name = 'Tollcross'

-- 9:
SELECT stopb.name, a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'